//
//  OfferCollectionViewCell.swift
//  sbermegadrug
//
//  Created by Ванурин Алексей Максимович on 29.05.2021.
//

import Foundation
import UIKit
import Kingfisher

final class OfferCollectionViewCell: UICollectionViewCell {
    
    lazy private var offerImageView: UIImageView = {
        $0.contentMode = .scaleAspectFit
        return $0
    }(UIImageView())
    
    lazy private var offerTitleLabel: UILabel = {
        $0.numberOfLines = 0
        
        return $0
    }(UILabel())
    
    lazy private var priceLabel: UILabel = {
        $0.textAlignment = .right
        
        return $0
    }(UILabel())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(_ model: OfferCollectionModel) {
        if let url = URL(string: model.imageUrl) {
            offerImageView.kf.setImage(with: url, placeholder: UIImage(named: "noPhoto"))
        } else {
            offerImageView.image = UIImage(named: "noPhoto")
        }
        offerTitleLabel.text = model.title
        priceLabel.text = String(model.price)
    }
    
    func commonInit() {
        contentView.addSubview(offerImageView)
        contentView.addSubview(offerTitleLabel)
        contentView.addSubview(priceLabel)
        
        contentView.backgroundColor = .white
        
        offerImageView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(12.0)
            maker.trailing.equalToSuperview().offset(-12.0)
            maker.top.equalToSuperview().offset(12.0)
            maker.height.equalTo(100.0)
        }
        
        offerTitleLabel.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(12.0)
            maker.top.equalTo(offerImageView.snp.bottom)
            maker.trailing.equalToSuperview().offset(-4.0)
        }
        
        priceLabel.snp.makeConstraints { maker in
            maker.trailing.equalToSuperview().offset(-10.0)
            maker.bottom.equalToSuperview().offset(-4.0)
        }
        
    }
    
}
