//
//  CartHeaderTableView.swift
//  sbermegadrug
//
//  Created by Ванурин Алексей Максимович on 29.05.2021.
//

import Foundation
import UIKit


struct CartHeaderTableViewCellModel: CartModel {
    //
}

final class CartHeaderTableViewCell: UITableViewCell {
    
    lazy private var headerTitleLabel: UILabel = {
        $0.text = "Корзина"
        $0.textAlignment = .center
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
        contentView.addSubview(headerTitleLabel)
        headerTitleLabel.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
    }
    
}
