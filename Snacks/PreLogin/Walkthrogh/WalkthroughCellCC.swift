//
//  WalkthroughCellCC.swift
//  Snacks
//
//  Created by Rishabh Sharma on 25/03/24.
//

import UIKit

class WalkthroughCellCC: UICollectionViewCell {
    
    // MARK: - UI Elements
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .systemGray6
        imageView.image = UIImage(named: "")
        return imageView
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20,weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.addSubview(imageView)
        self.addSubview(label)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.6)
        }
        label.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
        }
    }
    
    func configure(image: String, text: String) {
        imageView.image = UIImage(named: image)
        label.text = text
    }
}
