//
//  OrderTable.swift
//  Oduk
//
//  Created by 허성필 on 4/8/25.
//

import Foundation
import UIKit
import SnapKit

class OrderTable: UIView {
    
    private let countLabel = UILabel()
    private let priceLabel = UILabel()
    
    var dataSource = [CustomCellModel]()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        self.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(99)
        }
        
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTableView()
        loadData()
        makeLabel()
    }
    
    // 스토리보드를 사용할 때 코드랑 연결해주는 부분?
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTableView() {
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor(
            red: 248/255.0,
            green: 248/255.0,
            blue: 248/255.0,
            alpha: 1.0
        )
        tableView.separatorStyle = .none // 셀들의 구분선 제거
    }
    
    func loadData() {
        tableView.reloadData()
        didUpdateCounts()
    }
    
    func makeLabel() {
        
        countLabel.font = UIFont(name: "GmarketSansMedium", size: 14)
        priceLabel.font = UIFont(name: "GmarketSansMedium", size: 14)
        
        [countLabel, priceLabel].forEach {
            self.addSubview($0)
        }
        
        countLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.bottom).offset(5)
            make.leading.equalTo(167)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.bottom).offset(5)
            make.trailing.equalTo(self.snp.trailing).inset(19)
        }
    }
}

extension OrderTable: UITableViewDelegate, UITableViewDataSource, CustomCellDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier) as? CustomCell ?? CustomCell()
        cell.delegate = self
        cell.indexPath = indexPath
        cell.bind(model: dataSource[indexPath.row]) // 0번째 cell에는 dataSource[0] 데이터
        cell.backgroundColor = UIColor(
            red: 248/255.0,
            green: 248/255.0,
            blue: 248/255.0,
            alpha: 1.0
        )
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 33 // 테이블 뷰에서 보이고 싶은 셀의 수 = 3  테이블 뷰의 높이 = 99
        // 따라서 높이 ÷ 보이고 싶은 셀의 수  99 ÷ 3 = 33
    }
    
    func didChangeCount(to newCount: Int, at indexPath: IndexPath) {
        dataSource[indexPath.row].count = newCount
        if dataSource[indexPath.row].count == 0 { // 개수가 0일 때 삭제하고 지워버림
            dataSource.remove(at: indexPath.row) // 카운트가 0개인 셀 삭제
            loadData() // 테이블 뷰 reLoad
        }
        didUpdateCounts() // 다시 계산해서 업데이트
    }
    
    func didUpdateCounts() {
        var totalCount = 0
        var totalPrice = 0
        
        for item in dataSource {
            let count = item.count
            let price = Int(item.priceLabel.dropLast(1)) ?? 0
            totalCount += count
            totalPrice += count * price
        }
        
        countLabel.text = "총 \(totalCount)개"
        priceLabel.text = "₩ \(totalPrice)원"
    }
}
