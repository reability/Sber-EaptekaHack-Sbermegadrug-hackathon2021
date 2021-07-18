//
//  CartViewController.swift
//  sbermegadrug
//
//  Created by Ванурин Алексей Максимович on 29.05.2021.
//

import Foundation
import UIKit

final class CartViewController: UIViewController {
    
    var model: [CartModel] = []
    
    func updateModel(with catalogItem: CatalogItemEntity) {
        self.model = [
            CartHeaderTableViewCellModel(),
            CartItemTableViewCellModel(name: catalogItem.title, imageString: catalogItem.imageString, price: catalogItem.price, amount: 1),
            CartItemTableViewFooterCellModel()
        ]
        tableView.reloadData()
    }
    
    lazy private var tableView: UITableView = {
        return $0
    }(UITableView())
    
    override func viewDidLoad() {
        
        self.model = [
            //CartHeaderTableViewCellModel(),
            //CartItemTableViewCellModel(name: "fd", imageString: "https://cdn.eapteka.ru/upload/offer_photo/999/55/1_6d483b0739b1eafa7dc9961622946611.jpeg?_cvc=1622209430", price: 100, amount: 1),
            //CartItemTableViewCellModel(name: "fd", imageString: "https://cdn.eapteka.ru/upload/offer_photo/999/55/1_6d483b0739b1eafa7dc9961622946611.jpeg?_cvc=1622209430", price: 100, amount: 1),
           // CartItemTableViewFooterCellModel()
        ]
        
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.separatorStyle = .none
        
        tableView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
        
        tableView.register(CartHeaderTableViewCell.self, forCellReuseIdentifier: "header")
        tableView.register(CartItemTableViewCell.self, forCellReuseIdentifier: "item")
        tableView.register(CardItemTableViewFooterTableViewCell.self, forCellReuseIdentifier: "footer")
    }
    
}

extension  CartViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let m = model[indexPath.row]
        
        switch m {
        case is CartHeaderTableViewCellModel:
            let cell = tableView.dequeueReusableCell(withIdentifier: "header") as! CartHeaderTableViewCell
            
            return cell
        case is CartItemTableViewCellModel:
            let cell = tableView.dequeueReusableCell(withIdentifier: "item") as! CartItemTableViewCell
            cell.setup((m as! CartItemTableViewCellModel))
            return cell
        case is CartItemTableViewFooterCellModel:
            let cell = tableView.dequeueReusableCell(withIdentifier: "footer") as! CardItemTableViewFooterTableViewCell
            
            return cell
        default:
            fatalError()
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let m = model[indexPath.row]
        
        switch m {
        case is CartHeaderTableViewCellModel:
            return 40.0
        case is CartItemTableViewCellModel:
            return 200.0
        case is CartItemTableViewFooterCellModel:
            return 45.0
        default:
            return 10.0
        }
    }
    
    
    
    
}
