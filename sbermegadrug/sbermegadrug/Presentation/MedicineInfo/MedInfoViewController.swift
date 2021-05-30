//
//  MedInfoViewController.swift
//  sbermegadrug
//
//  Created by Sergey Vanurin on 30.05.2021.
//

import Foundation
import UIKit

final class MedInfoController: UIViewController {
    
    var model: OfferCollectionModel!
    
    private lazy var holderView: UIView = {
        $0.backgroundColor = .white
        return $0
    }(UIView())
    
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
    
    func setup(_ model: OfferCollectionModel) {
        if let url = URL(string: model.imageUrl) {
            offerImageView.kf.setImage(with: url, placeholder: UIImage(named: "noPhoto"))
        } else {
            offerImageView.image = UIImage(named: "noPhoto")
        }
        offerTitleLabel.text = model.title
        priceLabel.text = "Цена:" + String(model.price)
    }
    
    
    override func viewDidLoad() {
        setup(model)
        view.addSubview(holderView)
        holderView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
        
        holderView.addSubview(offerImageView)
        holderView.addSubview(offerTitleLabel)
        holderView.addSubview(priceLabel)
        
        offerImageView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(12.0)
            maker.trailing.equalToSuperview().offset(-12.0)
            maker.top.equalToSuperview().offset(12.0)
            maker.height.equalTo(200.0)
        }
        
        offerTitleLabel.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(12.0)
            maker.top.equalTo(offerImageView.snp.bottom)
            maker.trailing.equalToSuperview().offset(-4.0)
        }
        
        priceLabel.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(12.0)
            maker.top.equalTo(offerTitleLabel.snp.bottom).offset(4.0)
        }
        
        
    }
    
}
