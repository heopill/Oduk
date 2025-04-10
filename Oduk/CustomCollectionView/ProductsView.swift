//
//  ProductsView.swift
//  Oduk
//
//  Created by 최영락 on 4/8/25.
//

import UIKit
import SnapKit

protocol MyCelldelegate {
    func sendData(name: String, price: String)
}

class ProductCollectionView: UIView {
    
    //collectionView 상수 생성 타입은 UICollectionView
    public let collectionView: UICollectionView = {
        
        //layout설정
        var layout = UICollectionViewFlowLayout()
        //scrollDirection 타입은 horizontal : 옆으로 쓸어 넘기기
        layout.scrollDirection = .horizontal
        // 셀 마다 가로의 간격은 24
        layout.minimumLineSpacing = 24
        // 셀 마다 세로의 간격은 25
        layout.minimumInteritemSpacing = 25
        //셀의 좌우 여백 설정
        layout.sectionInset = UIEdgeInsets(top: 0, left: 12, bottom: 21, right: 12)
        // 컬렉션뷰를 위치 0 크기 0 으로 설정 나중에 Snapkit을 이용해 makeConstraints 해야함. 아까만든 변수 layout을 선정하여 셀을 뱇함
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        // 컬렉션뷰 배경색깔
        collectionView.backgroundColor = .white
        // collcetionView로 반환
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    func setupLayout() {
        addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

class MyCollectionViewCell: UICollectionViewCell {
    //셀을 재사용할때 쓸 identifier
    static let identifier = "MyCollectionViewCell"
    
    //버튼의 설정
    private let cartButton: UIButton = {
        let button = UIButton()
        //        button.setImage(UIImage(named: "장바구니누끼"), for: .normal)
        button.backgroundColor = .clear
        button.imageView?.contentMode = .scaleAspectFit
        button.clipsToBounds = true
        button.setImage(UIImage(named: "장바구니"), for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchDown)
        return button
    }()
    
    //imageView의 설정
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    //상품이름 nameLabel 설정
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "Electrical-Safety-Regular", size: 18)
        return label
    }()
    
    //상품가격 priceLabel 설정
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "GmarketSansMedium", size: 14)
        return label
    }()
    
    var delegate: MyCelldelegate?
    
//    private let logo: UIImageView = {
//        let image = UIImageView()
//        image.image = UIImage(named: "오더ㅋ핑크")
//        return image
//    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //  Congifure Label
        
        //contentView의 아들뷰들 추가
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(cartButton)
        
        contentView.layer.cornerRadius = 6
        
        //imageView의 제약조건을 만듬
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.trailing.equalToSuperview().inset(12)
            //            make.height.equalTo(imageView.snp.width) // 정사각형
            make.height.equalTo(160)
        }
        
        //nameLabel의 제약조건을 만듬
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(10)
        }
        
        //priceLabel의 제약조건을 만듦
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(10)
        }
        
        cartButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(45) // 아래쪽에서 8pt 간격
            make.trailing.equalToSuperview().inset(11) // 오른쪽에서 8pt 간격
            make.size.equalTo(45)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // contentView의 구성을 정함. 배경, nameLabel에는 뭐가 들어갈지 ~
    func configure(with viewModel: ProductModel) {
        contentView.backgroundColor = .white
        nameLabel.text = viewModel.name
        imageView.image = UIImage(named: viewModel.imageName)
        priceLabel.text = viewModel.price
    }
    
    @objc func buttonTapped(_ sender: ProductCollectionView) {
        guard let productName = self.nameLabel.text else { return }
        guard let productPrice = self.priceLabel.text else { return }
        delegate?.sendData(name: productName, price: productPrice)
        print(productName)
        print(productPrice)
        
    }
}



