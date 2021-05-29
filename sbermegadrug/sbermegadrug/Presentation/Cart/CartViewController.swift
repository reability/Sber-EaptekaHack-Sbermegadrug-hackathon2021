//
//  CartViewController.swift
//  sbermegadrug
//
//  Created by Ванурин Алексей Максимович on 29.05.2021.
//

import Foundation
import UIKit

final class CartViewController: UIViewController {
    
    lazy private var tableView: UITableView = {
        return $0
    }(UITableView())
    
    override func viewDidLoad() {
        
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
    }
    
}

extension  CartViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
    
    
}
