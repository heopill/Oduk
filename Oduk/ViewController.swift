//
//  ViewController.swift
//  Oduk
//
//  Created by 허성필 on 4/7/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        let orderVC = OrderViewController()
        addChild(orderVC)
        view.addSubview(orderVC.view)
        orderVC.view.frame = view.bounds
        orderVC.didMove(toParent: self)
    }
}
            
        
