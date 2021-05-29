//
//  CatalogViewController.swift
//  sbermegadrug
//
//  Created by Ванурин Алексей Максимович on 29.05.2021.
//

import Foundation
import UIKit


final class CatalogViewController: UIViewController {
    
    var model: [CatalogItemEntity]!
    var filteredModel: [CatalogItemEntity]!
    
    lazy private var searchBar: UISearchBar = {
        return $0
    }(UISearchBar())
    
    lazy private var tableView: UITableView = {
        return $0
    }(UITableView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model = []
        filteredModel = []
        tableView.register(MedIteTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
}

extension CatalogViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = filteredModel[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MedIteTableViewCell
        
        return cell
    }
    
}
