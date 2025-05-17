//
//  MissionType.swift
//  T3F4_dev
//
//  Created by 양승완 on 5/18/25.
//

import Foundation
enum MissionType {
    case cleanPlate
    case tumbler
    case upcycling
    case petLabel
    case multiuse
    case flogging
  
  init(fromTitle title: String) {
    switch title {
    case "음식 남기지 않기":
      self = .cleanPlate
    case "매일 텀블러 사용":
      self = .tumbler
    case "업사이클링 실천":
      self = .upcycling
    case "페트병 라벨 제거해서 버리기":
      self = .petLabel
    case "다회용기 챙겨서 테이크아웃":
      self = .multiuse
    case "플로깅 2회 이상":
      self = .flogging
    default:
      // 기본값 설정 또는 에러 처리
      self = .cleanPlate
    }
  }
}

extension MissionType {
    var prompt: String {
        switch self {
            
        case .cleanPlate:
                    """
                    당신은 식사 후 남은 잔반을 분석하는 전문가 AI입니다.
                    업로드된 사진을 보고 다음 항목만 JSON으로 응답하세요.
                    - success: 잔반이 기준 이하로 적절히 남았으면 true, 많으면 false
                    - errors: 판단 실패 시 이유
                    - message: 간단한 한국어 설명
                    
                    반드시 JSON 형식으로만, 키는 오직 success, errors, message 만 포함해야 합니다.
                    """
        case .tumbler:
                    """
                    당신은 사진 속에 텀블러가 있는지 판별하는 전문가 AI입니다.  
                    업로드된 사진을 보고 다음 항목만 JSON으로 응답하세요.  
                    - success: 텀블러가 명확히 인식되면 true, 아니면 false  
                    - errors: 판단 실패 시 이유
                    - message: 간단한 한국어 설명  
                    
                    반드시 JSON 형식으로만, 키는 오직 success, errors, message 만 포함해야 합니다.
                    """
        case .upcycling:
                    """
                    당신은 업사이클(새활용) 실천 여부가 사진 한 장에 명확히 드러나는지 판별하는 전문가 AI입니다.  
                    업로드된 사진을 보고 다음 항목만 JSON으로 응답하세요.  
                    - success: 업사이클 실천이 명확히 확인되면 true, 아니면 false  
                    - errors: 판단 실패 시 이유  
                    - message: 간단한 한국어 설명  
                    
                    반드시 JSON 형식으로만, 키는 오직 success, errors, message 만 포함해야 합니다.
                    """
        case .petLabel:
                    """
                    당신은 사진 속 라벨을 제거한 페트병이 인증 기준에 부합하는지 판별하는 전문가 AI입니다.  
                    업로드된 사진을 보고 다음 항목만 JSON으로 응답하세요.  
                    - success: 라벨이 깔끔하게 제거되고 병 상태가 적합하면 true, 아니면 false  
                    - errors: 판단 실패 시 이유
                    - message: 간단한 한국어 설명  
                    """
        case .multiuse:
                    """
                    당신은 한 장의 사진 속에 다회용기와 영수증이 함께 찍힌 이미지를 분석하는 전문가 AI입니다.  
                    사진에서 OCR을 통해 영수증의 주문 내역을 추출하고, 이미지 인식을 통해 다회용기 안의 음식 종류를 식별한 뒤 두 목록이 일치하는지 판단해야 합니다.  
                    반드시 JSON 형식으로만, 키는 오직 아래 세 가지만 포함하세요.  
                    - success: 주문 내역과 용기 내 음식이 일치하면 true, 아니면 false  
                    - errors: 판단 실패 시 이유
                    - message: 간단한 한국어 설명  
                    """
        case .flogging:
                    """
                    당신은 사진 한 장으로 ‘플로깅(plogging)’ 활동이 이루어지고 있는지를 판별하는 전문가 AI입니다.  
                    사진에서 사람이 조깅하면서 쓰레기를 줍는 장면이 명확히 보이면 성공으로 간주합니다.  
                    업로드된 사진을 보고 다음 키만 JSON으로 응답하세요.  
                    - success: 플로깅이 명확히 확인되면 true, 아니면 false  
                    - errors: 판단 실패 또는 불명확한 이유 목록(성공 시 빈 배열)  
                    - message: 간단한 한국어 설명    
                    """
          
        }
    }
}
