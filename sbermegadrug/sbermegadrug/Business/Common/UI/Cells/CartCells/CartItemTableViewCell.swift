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
        
        return $0
    }(UIView())
    
    lazy private var medImageView: UIImageView = {
        return $0
    }(UIImageView())
    
    func setup(_ model: CartItemTableViewCellModel) {
        layout()
        layoutIfNeeded()
    }
    
    func layout() {
        contentView.addSubview(cardHolderView)
        cardHolderView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(8.0)
            maker.top.equalToSuperview().offset(4.0)
            maker.trailing.equalToSuperview().offset(-8.0)
            maker.bottom.equalToSuperview().offset(-4.0)
        }
        cardHolderView.addSubview(medImageView)
        medImageView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview()
            maker.top.equalToSuperview()
            maker.width.equalTo(200.0)
            maker.height.equalTo(200.0)
        }
    }
    
}
