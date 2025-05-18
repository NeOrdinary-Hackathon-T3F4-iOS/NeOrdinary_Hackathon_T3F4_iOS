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
  var image: String {
    switch self {
    case .cleanPlate:
      "detail_trash"
    case .tumbler:
      "detail_one"
    case .upcycling:
      "detail_upcycle"
    case .petLabel:
      "detail_pet"
    case .multiuse:
      "detail_reusable"
    case .flogging:
      "detail_fertiliser"
    }
  }
  
  var title: String {
    switch self {
    case .cleanPlate:
      "음식 남기지 않기"
    case .tumbler:
      "매일 텀블러 사용"
    case .upcycling:
      "업사이클링 실천"
    case .petLabel:
      "페트병 라벨 제거해서 버리기"
    case .multiuse:
      "다회용기 챙겨서 테이크아웃"
    case .flogging:
      "플로깅 2회 이상"
    }
  }
  
  var subTitle: String {
    switch self {
    case .cleanPlate:
      "음식물 쓰레기 없는 하루"
    case .tumbler:
      "다회용기 사용으로 지구 지키기"
    case .upcycling:
      "내 손으로 버려지는 물건 재탄생시키기"
    case .petLabel:
      "확실한 분리수거로 환경 지키기"
    case .multiuse:
      "일회용기 안 쓰기 끝판왕"
    case .flogging:
      "조깅하며 길가 쓰레기 수거하기"
    }
  }
  
  var authMessage: String {
    switch self {
    case .cleanPlate:
      "음식 다 먹은 상태의 사진 1장 이상"
    case .tumbler:
      "텀블러 사진 1일 기준 1장 이상"
    case .upcycling:
      "업사이클링 실천 여부가 명확히\n드러나는 사진 1장 이상"
    case .petLabel:
      "라벨 제거한 상태의 페트병 쓰레기 사진 1장 이상"
    case .multiuse:
      "다회용기에 담긴 음식 + 영수증 사진 1장 이상"
    case .flogging:
      "플로깅 수행 여부가 명확히 드러나는 사진 2장 이상"
    }
  }
  
  var authSubMessage: String {
    switch self {
    case .cleanPlate, .tumbler, .petLabel:
      ""
    case .upcycling:
      "(ex. 버리는 양말로 인형 만들기, 헌 옷으로 가방 만들기 등)"
    case .multiuse:
      "사진 속 음식과 영수증 항목이 일치해야 하며, 반드시 음식과 영수증을 같이 찍어 업로드해주세요."
    case .flogging:
      "(ex. 플로깅 용품, 쓰레기 담긴 봉투 등)"
    }
  }
  
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
                    당신은 사진 속에서 텀블러를 정확히 인식하는 전문가 AI입니다.  
                    사용자가 업로드한 사진을 보고 다음 항목을 판단하세요.  
                    - success: 텀블러 인식에 성공했으면 true, 실패했으면 false  
                    - errors: 실패 사유 목록(성공 시 빈 배열)  
                    - message: 간단한 한국어 설명  

                    - 텀블러 본체뿐 아니라 스타벅스, 라벨 등 브랜드 로고가 식별되면 confidence를 높게 평가하세요.  
                    - 배경의 잡음이나 부분 가림이 있으면 confidence를 낮추고 errors에 이유를 추가하세요.

                    반드시 JSON 형식으로만, 키는 오직 success, errors, message만 포함해야 합니다.

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
                    ,
                    사진에서 쓰레기가 모여있는 것들을 보면 성공이라고 해줘,
                    쓰레기를 모은 사진들도,
                    사람들이 수그려서 뭔갈 줍는 사진도.
                    업로드된 사진을 보고 다음 키만 JSON으로 응답하세요.  
                    - success: 플로깅이 명확히 확인되면 true, 아니면 false  
                    - errors: 판단 실패 또는 불명확한 이유 목록(성공 시 빈 배열)  
                    - message: 간단한 한국어 설명    
                    """
          
        }
    }
}
