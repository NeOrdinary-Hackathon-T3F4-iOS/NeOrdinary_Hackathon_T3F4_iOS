import UIKit

struct gptResult: Decodable {
    let success: Bool
    let errors: String?
    let message: String?
}





class OpenAIImageEvaluator {
    
    
    static let shared = OpenAIImageEvaluator()
    
    private init() {}
    
    
    private let model = "gpt-4o"
    private let endpoint = URL(string: "https://api.openai.com/v1/chat/completions")!


    func evaluateMealImage(image: UIImage, apiKey: String, type: MissionType) async throws -> gptResult {
        let imageBase64 = image.jpegData(compressionQuality: 0.8)!.base64EncodedString()
        let prompt = type.prompt + "너 생각에 40퍼정도 이상이면 성공이라고 해줘"

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

        print("is In OpenAI? ")
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
        print("jsonData:\(jsonData)")
        return try JSONDecoder().decode(gptResult.self, from: jsonData)
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
