//
//  SplashVC.swift
//  T3F4_dev
//
//  Created by 양승완 on 5/17/25.
//


import Foundation
import UIKit


/**
 스플래시 화면 뷰 컨트롤러
 */
class SplashVC: UIViewController {
    
    private var maxseconds: Int = 2
    private var timer = Timer()
    private var logo = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        self.navigationController?.navigationBar.isHidden = true
        makelogo()
        runtimer()
        
        print(FontManager.shared.medium(ofSize: 12))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func makelogo() {
        self.view.addSubview(logo)
        
        
        logo.image = UIImage(named: "logo.png")
        logo.contentMode = .scaleAspectFit
        
        
        logo.translatesAutoresizingMaskIntoConstraints = false
        //        logo.snp.makeConstraints {
        //            $0.center.equalToSuperview()
        //            $0.width.equalTo(266)
        //            $0.height.equalTo(92)
        //        }
        
        
    }
    
    
    func runtimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updatetimer), userInfo: nil, repeats: true)
    }
    
    /**
     타이머 동작 함수
     */
    @objc func updatetimer() {
        maxseconds = maxseconds - 1
        print(maxseconds)
        if maxseconds == 0 {
            timer.invalidate()
            print("timer Invalidate")
            navigationController?.viewControllers = [MainVC()]
            return
        } else if maxseconds < 0 {
            timer.invalidate()
            return
        }
        
    }
    
}
