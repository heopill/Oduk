//
//  OrderErrorHandler.swift
//  Oduk
//
//  Created by 전원식 on 4/10/25.
//

import UIKit


enum OrderError: Error {
    case maxLimitReached
    case emptyOrder
    case cancelConfirmation
    case noneError
    case completePayment
    case emptyCancel
}


final class OrderErrorHandler {
    static func showAlert(for error: OrderError, in viewController: UIViewController, completion: (() -> Void)? = nil) {
        var title = ""
        var message = ""
        var actions: [UIAlertAction] = []

        switch error {
        case .maxLimitReached:
            title = "수량 제한"
            message = "최대 10개까지만 선택할 수 있습니다."
            actions = [UIAlertAction(title: "확인", style: .default)]

        case .emptyOrder:
            title = "결제 불가"
            message = "주문할 상품이 없습니다. 상품을 선택해주세요."
            actions = [UIAlertAction(title: "확인", style: .default)]
            

        case .cancelConfirmation:  // 연결 완료
            title = "확인"
            message = "주문 내역을 모두 삭제하시겠습니까?"
            actions = [
                UIAlertAction(title: "취소", style: .cancel),
                UIAlertAction(title: "삭제", style: .destructive, handler: { _ in
                    completion?()
                })
            ]
            
        case .noneError:  // 연결 완료
            title = "확인"
            message = "주문 내역을 결제하시겠습니까?"
            actions = [
                UIAlertAction(title: "취소", style: .cancel),
                UIAlertAction(title: "결제", style: .default, handler: { _ in
                    completion?()
                })
            ]
            
        case .completePayment:  // 연결 완료
            title = "결제 완료"
            message = "주문하신 상품이 익일 출고 예정입니다!"
            actions = [UIAlertAction(title: "OK", style: .cancel)]
         
        case .emptyCancel:
            title = "취소 불가"
            message = "취소할 상품이 없습니다. 상품을 선택해주세요."
            actions = [UIAlertAction(title: "확인", style: .default)]
        }

        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions.forEach { alert.addAction($0) }
        viewController.present(alert, animated: true)
    }
}
