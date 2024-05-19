//
//  WalkthroughVC.swift
//  Snacks
//
//  Created by Rishabh Sharma on 25/03/24.
//

import UIKit
import SnapKit

class WalkthroughVC: UIViewController {
    
    // MARK: - Properties
    private var imageArr = ["walk1","walk2","walk3","walk4"]
    private var textArr = ["Skip those lengthy lines and order your favorite movie snacks.","Upgrade your movie experience with snacks delivered to your seat.","Wide selection of movie snacks, from popcorns and nachos to candies and soft drinks","Enjoy hassle-free payment experience with secure in-app payment options"]
    
    // MARK: - UI Elements
    lazy var collectionView : UICollectionView = {
        var flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowLayout)
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.register(WalkthroughCellCC.self, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    lazy var imageView1: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "selectedRectangle")
        return imageView
    }()
    lazy var imageView2: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "unselectedRectangle")
        return imageView
    }()
    lazy var imageView3: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "unselectedRectangle")
        return imageView
    }()
    lazy var imageView4: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "unselectedRectangle")
        return imageView
    }()
    
    lazy var scrollStack : UIStackView = {
        var stackView = UIStackView(arrangedSubviews: [imageView1,imageView2,imageView3,imageView4])
        stackView.spacing = 10
        return stackView
    }()
    
    lazy var nextButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "nextButton"), for: .normal)
        return button
    }()
    
    lazy var getStartedButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Get Started", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.backgroundColor = UIColor(red: 218/255, green: 55/255, blue: 50/255, alpha: 1)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        getStartedButton.isHidden = true
        nextButton.addTarget(self, action: #selector(getStartedButtonAction), for: .touchUpInside)
        getStartedButton.addTarget(self, action: #selector(getStartedButtonAction), for: .touchUpInside)
        setupView()
    }
    
    // MARK: - Button Actions
    @objc func nextButtonAction() {
        let visibleItems: NSArray = self.collectionView.indexPathsForVisibleItems as NSArray
        let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
        let nextItem: IndexPath = IndexPath(item: currentItem.item + 1, section: 0)
        self.collectionView.scrollToItem(at: nextItem, at: .left, animated: true)
    }
    
    @objc func getStartedButtonAction() {
        let viewController = SignInVC()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func setupView() {
        self.view.addSubview(collectionView)
        self.view.addSubview(scrollStack)
        self.view.addSubview(nextButton)
        self.view.addSubview(getStartedButton)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        scrollStack.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(collectionView.snp.bottom).multipliedBy(0.79)
        }
        nextButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().multipliedBy(0.95)
        }
        getStartedButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(nextButton)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(48)
        }
    }
}

extension WalkthroughVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? WalkthroughCellCC else {return UICollectionViewCell()}
        cell.configure(image: imageArr[indexPath.item], text: textArr[indexPath.item])
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let xPoint = scrollView.contentOffset.x + scrollView.frame.width / 2
        let yPoint = scrollView.frame.height / 2
        let center = CGPoint(x: xPoint, y: yPoint)
        if let ip = collectionView.indexPathForItem(at: center) {
            imageView1.image = UIImage(named: "unselectedRectangle")
            imageView2.image = UIImage(named: "unselectedRectangle")
            imageView3.image = UIImage(named: "unselectedRectangle")
            imageView4.image = UIImage(named: "unselectedRectangle")
            nextButton.isHidden = false
            getStartedButton.isHidden = true
            switch ip.row {
            case 0:
                imageView1.image = UIImage(named: "selectedRectangle")
            case 1:
                imageView2.image = UIImage(named: "selectedRectangle")
            case 2:
                imageView3.image = UIImage(named: "selectedRectangle")
            case 3:
                imageView4.image = UIImage(named: "selectedRectangle")
                nextButton.isHidden = true
                getStartedButton.isHidden = false
            default:
                imageView1.image = UIImage(named: "selectedRectangle")
            }
            print(ip.row)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}

