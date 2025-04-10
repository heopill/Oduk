//
//  Button.swift
//  Oduk
//
//  Created by 전원식 on 4/8/25.
//

import UIKit
import SnapKit

class OrderViewController: UIViewController {
    
    var orderItems: [OrderItem] = [
        OrderItem(name: "피곤한 영락티", quantity: 1, price: 500),
        OrderItem(name: "배고픈 다성티", quantity: 2, price: 500),
        OrderItem(name: "수줍은 원식티", quantity: 1, price: 500),
        OrderItem(name: "정열의 성필티", quantity: 3, price: 500)
    ]
    
    let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("전체 취소", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(UIColor(red: 229/255, green: 56/255, blue: 136/255, alpha: 1.0), for: .normal)
        button.layer.borderColor = UIColor(red: 229/255, green: 56/255, blue: 136/255, alpha: 1.0).cgColor
        button.layer.borderWidth = 1.5
        button.layer.cornerRadius = 59
        return button
    }()
    
    let payButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("결제하기", for: .normal)
        button.backgroundColor = UIColor(red: 229/255, green: 56/255, blue: 136/255, alpha: 1.0)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 59
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(cancelButton)
        view.addSubview(payButton)
        
        cancelButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(31)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(30)
            make.width.equalTo(152)
            make.height.equalTo(46)
        }

        payButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(31)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(30)
            make.width.equalTo(152)
            make.height.equalTo(46)
        }
        
        cancelButton.addTarget(self, action: #selector(cancelAllOrders), for: .touchUpInside)
        payButton.addTarget(self, action: #selector(processPayment), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        cancelButton.layer.cornerRadius = cancelButton.frame.height / 3
        payButton.layer.cornerRadius = payButton.frame.height / 3
    }
    
    @objc func cancelAllOrders() {
        print("모든 주문이 취소되었습니다.")
    }
    
    @objc func processPayment() {
        let total = 0
        print("총 결제 금액: \(total)원")
    }
}
