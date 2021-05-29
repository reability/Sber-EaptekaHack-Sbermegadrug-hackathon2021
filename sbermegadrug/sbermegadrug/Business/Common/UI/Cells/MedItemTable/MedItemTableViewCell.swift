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
        return $0
    }(UILabel())
    
    func commonInit() {
        contentView.addSubview(mainTitleLabelView)
        
        mainTitleLabelView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(10.0)
        }
    }
    
}
