//
//  MedItemTableViewCell.swift
//  sbermegadrug
//
//  Created by Ванурин Алексей Максимович on 29.05.2021.
//

import Foundation
import UIKit

final class MedIteTableViewCell: UITableViewCell {
    
    lazy private var mainTitleLabelView: UILabel = {
        $0.numberOfLines = 0
        $0.textColor = .black
        $0.backgroundColor = .white
        
        
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
        contentView.addSubview(mainTitleLabelView)
        
        mainTitleLabelView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(10.0)
            maker.trailing.equalToSuperview().offset(-40.0)
        }
    }
    
    func setUp(_ model: CatalogItemEntity) {
        mainTitleLabelView.text = model.title
    }
    
}
