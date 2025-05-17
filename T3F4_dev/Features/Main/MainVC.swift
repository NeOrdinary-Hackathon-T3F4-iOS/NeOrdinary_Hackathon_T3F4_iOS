//
//  ViewController.swift
//  T3F4_dev
//
//  Created by 양승완 on 5/17/25.
//

import UIKit
import SwiftUI
import Alamofire
import Then
import SnapKit
import Kingfisher

class MainVC: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
      
        let homeVC = UIHostingController(rootView: HomeView())
        homeVC.tabBarItem = UITabBarItem(title: "홈", image: UIImage(named: "homeTap"), tag: 0)

        let settingsVC = UIHostingController(rootView: ChallengeView())
        settingsVC.tabBarItem = UITabBarItem(title: "챌린지", image: UIImage(named: "challengeTap"), tag: 1)

        // 필요하면 UINavigationController로 감싸기
        let homeNav = UINavigationController(rootViewController: homeVC)
        let settingsNav = UINavigationController(rootViewController: settingsVC)
        
        tabBar.tintColor = UIColor(named: R.Color.primary_default.rawValue)
        tabBar.unselectedItemTintColor = UIColor(named: R.Color.neutral_40.rawValue)

        viewControllers = [homeNav, settingsNav]
    }
}
