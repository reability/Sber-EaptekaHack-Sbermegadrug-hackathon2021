//
//  CartItemTableViewFooter.swift
//  sbermegadrug
//
//  Created by Ванурин Алексей Максимович on 29.05.2021.
//

import Foundation
import UIKit

struct CartItemTableViewFooterCellModel: CartModel {
    
}

final class CardItemTableViewFooterTableViewCell: UITableViewCell {
    
    lazy private var button: UIButton = {
        $0.backgroundColor = .blue
        $0.layer.cornerRadius = 8.0
        $0.setTitle("Оформить", for: .normal)
        return $0
    }(UIButton())
    
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
        contentView.addSubview(button)
        button.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(40.0)
            maker.trailing.equalToSuperview().offset(-40.0)
            maker.bottom.equalToSuperview()
        }
    }
    
}
