//
//  SplashView.swift
//  Oduk
//
//  Created by Lee on 4/11/25.
//

import UIKit

class SplashView: UIView {

    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit

        imageView.image = UIImage(named: "SplashImage")

        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setUpUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpUI()
    }

    private func setUpUI() {
        self.addSubview(logoImageView)

        logoImageView.translatesAutoresizingMaskIntoConstraints = false

        logoImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}
