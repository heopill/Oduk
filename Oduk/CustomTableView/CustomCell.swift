//
//  CustomCell.swift
//  Oduk
//
//  Created by 허성필 on 4/9/25.
//

import UIKit
import SnapKit

protocol CustomCellDelegate: AnyObject {
    func didChangeCount(to newCount: Int, at indexPath: IndexPath)
}

class CustomCell: UITableViewCell {
    
    weak var delegate: CustomCellDelegate?
    
    static let identifier = "CustomCell"
    private var count: Int = 1
    private var model: CustomCellModel?
    var indexPath: IndexPath? 
    
    let leftLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont(name: "GmarketSansMedium", size: 13)
        return label
    }()
    
    lazy var minusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "minus.circle.fill"), for: .normal)
        button.tintColor = UIColor(red: 253/255, green: 141/255, blue: 194/255, alpha: 1) // #FD8DC2
        button.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside) // self 가 아닌 CustomCell.self인 이유
        return button
    }()
    
    let middleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "GmarketSansMedium", size: 14)
        return label
    }()
    
    lazy var plusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        button.tintColor = UIColor(red: 253/255, green: 141/255, blue: 194/255, alpha: 1) // #FD8DC2
        button.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let rightLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.font = UIFont(name: "GmarketSansMedium", size: 13)
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        [leftLabel, minusButton, middleLabel, plusButton, rightLabel].forEach {
            contentView.addSubview($0)
        }
        
        setupConstraints()
        //        setupActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been impl")
    }
    
    private func setupConstraints() {
        leftLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(19)
            make.centerY.equalToSuperview()
            make.width.equalTo(103)
            make.height.equalTo(21)
        }
        minusButton.snp.makeConstraints { make in
            make.leading.equalTo(leftLabel.snp.trailing).offset(31)
            make.centerY.equalToSuperview()
            make.height.equalTo(20)
        }
        
        middleLabel.snp.makeConstraints { make in
            make.leading.equalTo(minusButton.snp.trailing).offset(8)
            make.centerY.equalToSuperview()
            make.width.equalTo(20)
            make.height.equalTo(21)
        }
        
        plusButton.snp.makeConstraints { make in
            make.leading.equalTo(middleLabel.snp.trailing).offset(8)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(20)
        }
        
        rightLabel.snp.makeConstraints { make in
            make.leading.equalTo(plusButton.snp.trailing).offset(27)
            make.centerY.equalToSuperview()
            make.width.equalTo(72)
            make.height.equalTo(21)
        }
    }
    
    //    private func setupActions() {
    //        minusButton.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
    //        plusButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
    //    }
    
    // MARK: - Button Actions
    
    @objc private func minusButtonTapped() {
        print("마이너스 버튼 클릭")
        guard count > 0 else { return }
        self.count -= 1
        model?.count = self.count
        middleLabel.text = String(count)
        if let rightValue = Int(model?.rightLabel ?? "0") {
            rightLabel.text = "\(rightValue * count)원"
        }
        if let index = indexPath {
            delegate?.didChangeCount(to: count, at: index)
        }
    }
    
    @objc private func plusButtonTapped() {
        guard count < 10 else {
                if let vc = self.parentViewController {
                    OrderErrorHandler.showAlert(for: .maxLimitReached, in: vc)
                }
                return
            }
        print("플러스 버튼 클릭")
        self.count += 1
        model?.count = self.count
        middleLabel.text = String(count)
        if let rightValue = Int(model?.rightLabel ?? "0") {
            rightLabel.text = "\(rightValue * count)원"
        }
        if let index = indexPath {
            delegate?.didChangeCount(to: count, at: index)
        }
    }
    
}

// MARK: - Utils

extension CustomCell {
    public func bind(model: CustomCellModel) {
        self.model = model
        self.count = model.count
        leftLabel.text = model.leftLabel
        middleLabel.text = String(count)
        rightLabel.text = "\(Int(model.rightLabel) ?? 0 * model.count)원"
    }
}
