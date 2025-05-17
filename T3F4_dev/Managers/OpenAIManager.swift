import UIKit

struct ImageEvaluationResult: Decodable {
    let 남은잔반: Int
    let 가장가능성높은상태: String
    let 판단이유: String
}

class OpenAIImageEvaluator {
    
    
    static let shared = OpenAIImageEvaluator()
    
    private init() {}
    
    
    private let model = "gpt-4o"
    private let endpoint = URL(string: "https://api.openai.com/v1/chat/completions")!


    func evaluateMealImage(image: UIImage, apiKey: String) async throws -> ImageEvaluationResult {
        let imageBase64 = image.jpegData(compressionQuality: 0.8)!.base64EncodedString()
        let prompt = """
        이 이미지를 보고 식사 상태를 판단해주세요.
        결과는 아래 형식의 JSON으로 주세요:
        {
          "남은잔반": 0,
          
          "가장가능성높은상태": "식사후",
          "판단이유": "접시에 음식이 없고, 수저가 정리되어 있습니다."
        }
        남은잔반은 percent 값을 써줘

        """

        let message: [[String: Any]] = [
            [
                "role": "user",
                "content": [
                    ["type": "text", "text": prompt],
                    ["type": "image_url",
                     "image_url": ["url": "data:image/jpeg;base64,\(imageBase64)"]
                    ]
                ]
            ]
        ]

        let requestBody: [String: Any] = [
            "model": model,
            "messages": message,
            "temperature": 0.2
        ]

        var request = URLRequest(url: endpoint)
        request.httpMethod = "POST"
        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONSerialization.data(withJSONObject: requestBody)

        let (data, _) = try await URLSession.shared.data(for: request)

        guard let rawText = try? JSONDecoder().decode(OpenAIResponse.self, from: data).choices.first?.message.content else {
            throw NSError(domain: "ParsingError", code: 1, userInfo: nil)
        }

        // 마크다운 블록 제거
        let stripped = stripMarkdownCodeBlock(from: rawText)

        guard let jsonData = stripped.data(using: .utf8) else {
            throw NSError(domain: "InvalidData", code: 2)
        }

        return try JSONDecoder().decode(ImageEvaluationResult.self, from: jsonData)
    }

    private func stripMarkdownCodeBlock(from text: String) -> String {
        text
            .replacingOccurrences(of: #"(?m)^```json\s*\n"#, with: "", options: .regularExpression)
            .replacingOccurrences(of: #"(?m)^```\s*\n"#, with: "", options: .regularExpression)
            .replacingOccurrences(of: #"(?m)^```\s*$"#, with: "", options: .regularExpression)
    }
}

struct OpenAIResponse: Decodable {
    struct Choice: Decodable {
        struct Message: Decodable {
            let content: String
        }
        let message: Message
    }
    let choices: [Choice]
}
