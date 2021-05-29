//
//  CatalogViewController.swift
//  sbermegadrug
//
//  Created by Ванурин Алексей Максимович on 29.05.2021.
//

import Foundation
import UIKit


final class CatalogViewController: UIViewController {
    
    var service: FirebaseService = FirebaseServiceImp()
    
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
        model = CatalogItemEntity.stub
        filteredModel = model
        tableView.register(MedIteTableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        view.addSubview(searchBar)
        
        tableView.separatorStyle = .none
        
        searchBar.snp.makeConstraints { maker in
            maker.top.equalToSuperview()
            maker.leading.equalToSuperview()
            maker.trailing.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview()
            maker.trailing.equalToSuperview()
            maker.top.equalTo(searchBar.snp.bottom)
            maker.bottom.equalToSuperview()
        }
        
        service.getMeds { [weak self] result in
            DispatchQueue.main.async {
                self?.model = result
                self?.filteredModel = result
                self?.tableView.reloadData()
            }
        }
        
    }
    
    func openIn(tabView: UIView) {
        tabView.addSubview(self.view)
        view.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
    }
    		
}

extension CatalogViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = filteredModel[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MedIteTableViewCell
        cell.setUp(model)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = CartViewController()
        DispatchQueue.main.async {
            self.present(vc, animated: true, completion: nil)
        }
    }
    
}
