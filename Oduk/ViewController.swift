//
//  ViewController.swift
//  Oduk
//
//  Created by 허성필 on 4/7/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController, TopMenuBarDelegate {

    var currentData: [ProductModel] = []
    var tableViewData: [(String, String)] = []
  
    let productCollectionView = ProductCollectionView()
    let topMenuBar = TopMenuBar()
    let orderTable = OrderTable()
    let orderVC = OrderView()
    let logo = Logoview()

    // SplashView 생성
    let splashView = SplashView()
    
    // Page Control Indicator
    var pageControl: UIPageControl! 
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        configureLayout()

        configureCollectionView()
        setupPageControl()
        
        topMenuBar.topMenuBarDelegate = self
        topMenuBar(topMenuBar, didSelectIndex: 0)
        
        orderVC.delegate = self
        
        splashView.frame = view.bounds
        view.addSubview(splashView)
        
        // 여기서 맨 앞의 뷰로 확실히 지정해줌
        view.bringSubviewToFront(splashView)
        
        // 현재에서 2초 후에 dismiss되게 세팅
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.dismissSplashView()
        }
        
        orderTable.orderView = orderVC
        orderVC.delegate?.removeData()
    }
    
    func setupPageControl() {
            pageControl = UIPageControl()
            pageControl.tintColor = .gray
            pageControl.currentPageIndicatorTintColor = .red
            pageControl.pageIndicatorTintColor = .lightGray
            
            view.addSubview(pageControl)
            pageControl.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.bottom.equalToSuperview().inset(220)
            }
        }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            let page = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
            pageControl.currentPage = page
        }
    
    func topMenuBar(_ topMenuBar: TopMenuBar, didSelectIndex index: Int) {
            guard let category = ProductCategory(rawValue: index) else { return }
            currentData = ProductManager.getProducts(category)
            
            let indexPath = IndexPath(item: 0, section: 0)
            productCollectionView.collectionView.scrollToItem(at: indexPath, at: .left, animated: false)
            
            productCollectionView.collectionView.reloadData()
        
            pageControl.numberOfPages = (currentData.count/4)
            pageControl.currentPage = 0
        }
    }

// 컬렉션뷰 레아이웃 설정 클로저를 이용해 초기화 해주고 0으로 설정해줬기때문에 제약조건 설정함.
extension ViewController {
    func configureLayout() {
        
        [logo, topMenuBar, productCollectionView, orderTable, orderVC].forEach{
            view.addSubview($0)
        }
        
        productCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview() .offset(190)
            make.bottom.equalToSuperview().offset(-227)
            make.left.equalToSuperview().offset(17)
            make.right.equalToSuperview().offset(-17)
        }
        
        topMenuBar.snp.makeConstraints {
            $0.top.equalToSuperview().offset(131)
            $0.bottom.equalToSuperview().offset(-706)
            $0.left.equalToSuperview().offset(16)
            $0.right.equalToSuperview().offset(-16)
        }
        
        // 장바구니 목록 제약
        orderTable.snp.makeConstraints { make in
            make.top.equalTo(productCollectionView.snp.bottom).offset(6)
            make.bottom.equalToSuperview().offset(-122)
            make.left.right.equalToSuperview().inset(27)
        }
        
        // 버튼 제약 조건
        orderVC.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(780)
            make.bottom.equalToSuperview().inset(48)
            make.left.right.equalToSuperview().inset(31)
        }
      
        logo.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(72)
            make.bottom.equalToSuperview().inset(756)
            make.leading.trailing.equalToSuperview().inset(158)
        }

    }
    
    func configureCollectionView() {
        let collectionView = productCollectionView.collectionView
        // 페이징스크롤을 활성화함. 
        collectionView.isPagingEnabled = true
        // 인디게이터를 비활성화
        collectionView.showsHorizontalScrollIndicator = false
        // 걍 빠르게 해주는거
        collectionView.decelerationRate = .fast
        // delegate를 viewController self로 지정
        collectionView.delegate = self
        // dataSource를 viewController self로 지정
        collectionView.dataSource = self
        // 셀을 재사용 할 수 있게 해주는것
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
    }
}

extension ViewController: UICollectionViewDataSource, MyCelldelegate {
    
    func sendData(name: String, price: String) {
        let newItem = CustomCellModel(nameLabel: name, priceLabel: price)
        tableViewData.append((name, price))
        orderTable.dataSource.append(newItem)
        orderTable.loadData()
    }
    
    // 컬렉션뷰의 섹션 개수
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // 셀의 개수를 ProductsData의 count만큼 생성
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        currentData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath)
                as? MyCollectionViewCell else {
            fatalError()
        }
        cell.configure(with: currentData[indexPath.row])
        cell.delegate = self
        
        return cell
        
    }
    
    
}
// 셀 크기 설정
extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size: CGSize = CGSize(width: 160, height: 205)
        
        return size
        
    }
    
}

extension ViewController: ButtonDelegate {
    func removeData() {
        orderTable.dataSource.removeAll()
        orderTable.loadData()
    }
    
    func getCount() -> Int {
        return orderTable.totalCount
    }
    
    func getPrice() -> Int {
        return orderTable.totalPrice
    }

}

// SplashView 사라지게 하는 함수
extension ViewController {
    func dismissSplashView() {
        UIView.animate(withDuration: 0.5, animations: {
            self.splashView.alpha = 0
        }) { _ in
            self.splashView.removeFromSuperview()
        }
    }
}
