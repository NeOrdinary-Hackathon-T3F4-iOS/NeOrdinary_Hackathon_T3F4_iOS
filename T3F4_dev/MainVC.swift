//
//  ViewController.swift
//  T3F4_dev
//
//  Created by 양승완 on 5/17/25.
//

import UIKit

class MainVC: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
      let label = UILabel()
      label.text = "text"
      label.font = FontManager.shared.bold(ofSize: 20)
      self.view.addSubview(label)


      
      label.translatesAutoresizingMaskIntoConstraints = false
    
      NSLayoutConstraint.activate([
        label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        
        
      ])
      
    
//    self.view.backgroundColor = UIColor(named: "primary-default")
    // Do any additional setup after loading the view.
  }
}
