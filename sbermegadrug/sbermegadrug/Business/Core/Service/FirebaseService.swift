//
//  FirebaseService.swift
//  sbermegadrug
//
//  Created by Ванурин Алексей Максимович on 29.05.2021.
//

import Foundation
import FirebaseDatabase


protocol FirebaseService {
    func getMeds(completion: @escaping ([CatalogItemEntity])->())
}


final class FirebaseServiceImp: FirebaseService {
    
    var firebase: DatabaseReference!
    
    init() {
        firebase = Database.database().reference()
        //getMeds()
    }
    
    func getMeds(completion: @escaping ([CatalogItemEntity])->()) {
        firebase.child("products/").getData { (error, snapshot) in
            var result: [CatalogItemEntity] = []
            (snapshot.value as? NSArray)?.forEach({ data in
                let data = data as! NSDictionary
                result.append(.init(title: data["name"]! as! String, imageString: data["image"]! as! String, price: data["price"]! as! Int))
            })
            completion(result)
        }
    }
    
}
