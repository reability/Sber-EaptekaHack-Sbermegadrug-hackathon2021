//
//  CartItemTableViewCell.swift
//  sbermegadrug
//
//  Created by Ванурин Алексей Максимович on 29.05.2021.
//

import Foundation
import UIKit


struct CartItemTableViewCellModel: CartModel {
    let name: String
    let imageString: String
    let price: Int
    let amount: Int
}


final class CartItemTableViewCell: UITableViewCell {
    
    lazy private var cardHolderView: UIView = {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10.0
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 1
        $0.layer.shadowOffset = .zero
        $0.layer.shadowRadius = 4
        
        return $0
    }(UIView())
    
    lazy private var medImageView: UIImageView = {
        return $0
    }(UIImageView())
    
    lazy private var medTitleLabel: UILabel = {
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    lazy private var priceLabel: UILabel = {
        $0.textAlignment = .right
        return $0
    }(UILabel())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        selectionStyle = .none
        contentView.backgroundColor = UIColor.white
        layout()
    }
    
    func setup(_ model: CartItemTableViewCellModel) {
        if let url = URL(string: model.imageString) {
            medImageView.kf.setImage(with: url)
        } else {
            medImageView.image = UIImage(named: "noPhoto")
        }
        
        medTitleLabel.text = model.name
        priceLabel.text = String(model.price)
        
        
    }
    
    func layout() {
        contentView.addSubview(cardHolderView)
        cardHolderView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(18.0)
            maker.top.equalToSuperview().offset(14.0)
            maker.trailing.equalToSuperview().offset(-18.0)
            maker.bottom.equalToSuperview().offset(-14.0)
        }
        cardHolderView.addSubview(medImageView)
        medImageView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview()
            maker.top.equalToSuperview()
            maker.width.equalTo(150.0)
            maker.height.equalTo(150.0)
        }
        cardHolderView.addSubview(medTitleLabel)
        medTitleLabel.snp.makeConstraints { maker in
            maker.leading.equalTo(medImageView.snp.trailing).offset(16.0)
            maker.trailing.equalToSuperview().offset(-4.0)
            maker.top.equalToSuperview().offset(8.0)
        }
        cardHolderView.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { maker in
            maker.trailing.equalToSuperview().offset(-26.0)
            maker.bottom.equalToSuperview().offset(-15.0)
        }
    }
    
}
