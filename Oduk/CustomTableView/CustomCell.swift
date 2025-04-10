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
    
    let nameLabel: UILabel = {
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
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.font = UIFont(name: "GmarketSansMedium", size: 13)
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        [nameLabel, minusButton, middleLabel, plusButton, priceLabel].forEach {
            contentView.addSubview($0)
        }
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been impl")
    }
    
    private func setupConstraints() {
        nameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(19)
            make.centerY.equalToSuperview()
            make.width.equalTo(103)
            make.height.equalTo(21)
        }
        minusButton.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel.snp.trailing).offset(31)
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
        
        priceLabel.snp.makeConstraints { make in
            make.leading.equalTo(plusButton.snp.trailing).offset(27)
            make.centerY.equalToSuperview()
            make.width.equalTo(72)
            make.height.equalTo(21)
        }
    }
    
    // MARK: - Button Actions
    
    @objc private func minusButtonTapped() {
//        print("마이너스 버튼 클릭")
        self.count -= 1
        model?.count = self.count
        middleLabel.text = String(count)
        if let rightValue = Int(model?.priceLabel.dropLast(1) ?? "0") {
            priceLabel.text = "\(rightValue * count)원"
        }
        if let index = indexPath {
            delegate?.didChangeCount(to: count, at: index)
        }
        
        if count == 0 {
            self.removeFromSuperview()
        }
    }
    
    @objc private func plusButtonTapped() {
//        print("플러스 버튼 클릭")
        self.count += 1
        model?.count = self.count
        middleLabel.text = String(count)
        if let rightValue = Int(model?.priceLabel.dropLast(1) ?? "0") {
            priceLabel.text = "\(rightValue * count)원"
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
        nameLabel.text = model.nameLabel
        middleLabel.text = String(count)
        priceLabel.text = "\(Int(model.priceLabel.dropLast(1)) ?? 0 * model.count)원"
    }
}
