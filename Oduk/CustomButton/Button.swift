//
//  Button.swift
//  Oduk
//
//  Created by 전원식 on 4/8/25.
//

import UIKit
import SnapKit

class OrderView: UIView {
    
    var totalCount: Int = 0
    var totalPrice: Int = 0
    var onCancelAll: (() -> Void)?
        
    let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("전체 취소", for: .normal)
        button.setTitleColor(UIColor(red: 229/255, green: 56/255, blue: 136/255, alpha: 1.0), for: .normal)
        button.titleLabel?.font = UIFont(name: "GmarketSansBold", size: 18)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor(red: 229/255, green: 56/255, blue: 136/255, alpha: 1.0).cgColor
        button.layer.borderWidth = 1.5
        button.layer.cornerRadius = 16
        return button
    }()
    
    let payButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("결제하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "GmarketSansBold", size: 18)
        button.backgroundColor = UIColor(red: 229/255, green: 56/255, blue: 136/255, alpha: 1.0)
        button.layer.cornerRadius = 16
        return button
    }()
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            setupUI()
        }
        
        // 스토리보드를 사용할 때 코드랑 연결해주는 부분?
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    private func setupUI() {
        
        self.addSubview(cancelButton)
        self.addSubview(payButton)
        
        cancelButton.snp.makeConstraints { make in
            
//            make.edges.equalToSuperview()
            make.left.equalTo(self.snp.left)
            make.width.equalTo(152)
            make.height.equalTo(46)
        }

        payButton.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
            make.leading.equalTo(cancelButton.snp.trailing).offset(36)
            make.width.equalTo(152)
            make.height.equalTo(46)
        }
        
        cancelButton.addTarget(self, action: #selector(cancelAllOrders), for: .touchUpInside)
        payButton.addTarget(self, action: #selector(processPayment), for: .touchUpInside)
        
    }
    
    
    func updateSummary(totalCount: Int, totalPrice: Int) {
        self.totalCount = totalCount
        self.totalPrice = totalPrice
    }
    
    
    @objc func cancelAllOrders() {
        if let vc = self.parentViewController {
            OrderErrorHandler.showAlert(for: .cancelConfirmation, in: vc) {
                self.onCancelAll?()
            }
        }
    }
    
    @objc func processPayment() {
        if totalCount == 0 {
            if let vc = self.parentViewController {
                OrderErrorHandler.showAlert(for: .emptyOrder, in: vc)
            }
            return
        }

        print("총 결제 금액: \(totalPrice)원")
    }
    
}

// MARK: parentViewController

extension UIView {
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while let responder = parentResponder {
            if let vc = responder as? UIViewController {
                return vc
            }
            parentResponder = responder.next
        }
        return nil
    }
}
