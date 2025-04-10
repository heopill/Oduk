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
            message = "주문할 메뉴가 없습니다. 메뉴를 선택해주세요."
            actions = [UIAlertAction(title: "확인", style: .default)]

        case .cancelConfirmation:
            title = "확인"
            message = "주문 내역을 모두 삭제하시겠습니까?"
            actions = [
                UIAlertAction(title: "취소", style: .cancel),
                UIAlertAction(title: "삭제", style: .destructive, handler: { _ in
                    completion?()
                })
            ]
        }

        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions.forEach { alert.addAction($0) }
        viewController.present(alert, animated: true)
    }
}

