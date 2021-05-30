//
//  CatalogItemEntity.swift
//  sbermegadrug
//
//  Created by Ванурин Алексей Максимович on 29.05.2021.
//

import Foundation


struct CatalogItemEntity {
    
    let title: String
    let imageString: String
    let price: Int
    
    
}

extension CatalogItemEntity {
    
    static var stub: [CatalogItemEntity] {
        return [
        ]
    }
    
}
