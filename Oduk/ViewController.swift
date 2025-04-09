//
//  ViewController.swift
//  Oduk
//
//  Created by 허성필 on 4/7/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    //저장 프로퍼티는 extension에 넣을수 없음.
    let productCollectionView = ProductCollectionView()
    let topMenuBar = TopMenuBar()
  
    //생명주기중 하나인 viewDidLoad를 이용해 뷰가 로드될때 뷰의 배경을 흰색으로 만들고 함수들 실행
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureLayout()
        configureCollectionView()
        self.view = topMenuBar
        let orderTable = OrderTable()
        self.view = orderTable
    }
}

//컬렉션뷰 레아이웃 설정 클로저를 이용해 초기화 해주고 0으로 설정해줬기때문에 제약조건 설정함.
extension ViewController {
    func configureLayout() {
        
        //collectionView를 슈퍼뷰의 추가
        view.addSubview(productCollectionView)
        //컬렉션뷰 제약조건
        productCollectionView.snp.makeConstraints { make in
//            make.width.equalTo(368)
//            make.height.equalTo(457)
            make.top.equalToSuperview() .offset(190)
            make.bottom.equalToSuperview().offset(-227)
            make.left.equalToSuperview().offset(17)
            make.right.equalToSuperview().offset(-17)
            
        }
    }
    
    
    func configureCollectionView() {
        let collectionView = productCollectionView.collectionView
        // 페이징스크롤을 활성화함. ex) 아이폰 홈화면처럼 살짝만 넘겨도 한페이지가 넘어감 false일 경우 흐물흐물하게 넘어가다만다.
        collectionView.isPagingEnabled = true
        // 인디게이터를 비활성화
        collectionView.showsHorizontalScrollIndicator = false
        // 걍 빠르게 해주는거
        collectionView.decelerationRate = .fast
        //delegate를 viewController 스스로가 하겠다.
        collectionView.delegate = self
        //dataSource를 viewController 스스로가 하겠다.
        collectionView.dataSource = self
        // 셀을 재사용 할 수 있게 해주는것
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
    }
}
//컬렉션 뷰 델리게이트
extension ViewController: UICollectionViewDelegate {
}

extension ViewController: UICollectionViewDataSource {
    //컬렉션뷰의 섹션 개수
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //셀의 개수를 ProductsData의 count만큼 만든다.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        ProductsData.count
    }
    
    //Error방지?
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath)
                as? MyCollectionViewCell else {
            fatalError()
        }
        cell.configure(with: ProductsData[indexPath.row])
        
        
        return cell

    }
    
    
}
//셀 크기 설정
extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size: CGSize = CGSize(width: 160, height: 205)
        
        return size
        
    }
    
    
}

//ProductModel.swift파일에 있는 ProductModel struct에 값을 넣어주어서 이름과 이미지 가격 백그라운드 표시
private var ProductsData: [ProductModel] = [
    ProductModel(name: "피규어", backgroundColor: .white, imageName: "피규어", price: "3000원"),
    ProductModel(name: "피규어", backgroundColor: .white, imageName: "피규어", price: "3000원"),
    ProductModel(name: "피규어", backgroundColor: .white, imageName: "피규어", price: "3000원"),
    ProductModel(name: "피규어", backgroundColor: .white, imageName: "피규어", price: "3000원"),
    ProductModel(name: "피규어", backgroundColor: .white, imageName: "피규어", price: "3000원"),
    ProductModel(name: "피규어", backgroundColor: .white, imageName: "피규어", price: "3000원"),
    ProductModel(name: "피규어", backgroundColor: .white, imageName: "피규어", price: "3000원"),
    ProductModel(name: "피규어", backgroundColor: .white, imageName: "피규어", price: "3000원")
]







//thinking
//view가 4개거나( View 그냥 4개 ) , or 페이지가 정해져있거나 (아하!)
