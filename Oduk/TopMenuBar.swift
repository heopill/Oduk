//
//  TopMenuBar.swift
//  Oduk
//
//  Created by Lee on 4/8/25.
//

import UIKit
import SnapKit

class TopMenuBar: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(segmentControl)
        setUpSegmentControl()

        self.addSubview(underLineBar)
        setUpUnderLineBar()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    let segmentControl: UISegmentedControl = {
        let segment = UISegmentedControl()

        // segment의 항목을 Insert
        segment.insertSegment(withTitle: "피규어", at: 0, animated: true)
        segment.insertSegment(withTitle: "티셔츠", at: 1, animated: true)
        segment.insertSegment(withTitle: "키링", at: 2, animated: true)
        segment.insertSegment(withTitle: "베개", at: 3, animated: true)

        // segment의 기본 인덱스 설정
        segment.selectedSegmentIndex = 0

        // seleted segment의 font 세팅
        segment.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor(red: 250/255, green: 67/255, blue: 89/255, alpha: 1.0),
            NSAttributedString.Key.font: UIFont(name: "GmarketSansBold", size: 16) ?? UIFont.systemFont(ofSize: 16)
        ], for: .selected)

        // non-selected segment의 font 세팅
        segment.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.gray,
            NSAttributedString.Key.font: UIFont(name: "GmarketSansBold", size: 16) ?? UIFont.systemFont(ofSize: 16)
        ], for: .normal)

        // segment가 선택될 때의 색상, 현재 미적용
        segment.selectedSegmentTintColor = .clear

        // segment의 BackgroundImage를 미적용
        segment.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)

        // segment의 DivideImage를 미적용
        segment.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        return segment
    }()

    // segmentControl의 제약, addTarget
    func setUpSegmentControl() {
        segmentControl.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(72)
            $0.leading.equalTo(safeAreaLayoutGuide).offset(16)
            $0.trailing.equalTo(safeAreaLayoutGuide).offset(-16)
            $0.height.equalTo(36)
        }

        segmentControl.addTarget(self, action: #selector(changeUnderBarPosition(_:)), for: .valueChanged)
    }

    let underLineBar: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 250/255, green: 67/255, blue: 89/255, alpha: 1.0)
        return view
    }()

    @objc
    func changeUnderBarPosition(_ segment: UISegmentedControl) {
        let segmentCount = segmentControl.numberOfSegments

        let segmentWidth = segmentControl.bounds.width / CGFloat(segmentCount)

        let leadingDistance = CGFloat(segmentControl.selectedSegmentIndex) * segmentWidth

        UIView.animate(withDuration: 0.2) {
            self.underLineBar.snp.updateConstraints {
                $0.leading.equalTo(self.segmentControl.snp.leading).offset(leadingDistance)
            }
            self.segmentControl.layoutIfNeeded()
        }
    }

    func setUpUnderLineBar() {
        let bar = underLineBar

        bar.snp.makeConstraints {
            $0.top.equalTo(segmentControl.snp.bottom).offset(7)
            $0.width.equalTo(92)
            $0.height.equalTo(2)
            $0.leading.equalTo(segmentControl.snp.leading)
        }
    }
}
