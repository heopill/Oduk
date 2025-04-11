//
//  LogoView.swift
//  Oduk
//
//  Created by 최영락 on 4/10/25.
//

import Foundation
import UIKit

class Logoview: UIView {
    
    private let logo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "상단 로고")
        return image
    }()
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(logo)
    
        logo.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

