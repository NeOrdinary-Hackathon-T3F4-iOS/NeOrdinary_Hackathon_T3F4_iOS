//
//  SplashVC.swift
//  T3F4_dev
//
//  Created by 양승완 on 5/17/25.
//


import Foundation
import SwiftUI


/**
 스플래시 화면 뷰 컨트롤러
 */
class SplashVC: UIViewController {
  
  private var maxseconds: Int = 2
  private var timer = Timer()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .clear
    self.navigationController?.navigationBar.isHidden = true
    makelogo()
    runtimer()
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    KeyChainManager.shared.saveDeviceIdentifierToKeychain(UUID().uuidString)
    let uuid = KeyChainManager.shared.getDeviceIdentifierFromKeychain()
    print("uuid: ", uuid)
    if let uuid = uuid {
      APIManager.shared.performRequest(
        .members(membersUuids: uuid),
        completion: { result in
          print(result)
        }
      )
    }
  }
  
  private func makelogo() {
    let splashSwiftUIView = SplashView()
    let hostingVC = UIHostingController(rootView: splashSwiftUIView)
    
    addChild(hostingVC)
    view.addSubview(hostingVC.view)
    hostingVC.didMove(toParent: self)
    
    hostingVC.view.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      hostingVC.view.topAnchor.constraint(equalTo: view.topAnchor),
      hostingVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      hostingVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      hostingVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    ])
    
  }
  
  
  func runtimer() {
    timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updatetimer), userInfo: nil, repeats: true)
  }
  
  /**
   타이머 동작 함수
   */
  @objc func updatetimer() {
    maxseconds = maxseconds - 1
    if maxseconds == 0 {
      timer.invalidate()
      navigationController?.viewControllers = [MainVC()]
      return
    } else if maxseconds < 0 {
      timer.invalidate()
      return
    }
    
  }
  
}

struct SplashView: View {
  var body: some View {
    VStack(spacing: 10) {
      Spacer()
      Image("splashCharacter")
      Image("splash_logo")
      Spacer()
    }
  }
}
