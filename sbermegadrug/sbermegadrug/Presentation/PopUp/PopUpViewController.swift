//
//  PopUpViewController.swift
//  EaptekaAPP
//
//  Created by Sergey Vanurin on 28.05.2021.
//

import UIKit
import SnapKit

class PopUpViewController: UIViewController {
    
    var streak: Int!
    
    @objc func didTappedCloseButton() {
        print("works")
    }

    
    private lazy var holderView: UIView = {
        $0.backgroundColor = .white
        return $0
    }(UIView())
    
    private lazy var labelView: UILabel = {
        $0.text = "hello World\n"
        return $0
    }(UILabel())
    
    private lazy var buttonView: UIButton = {
        $0.setTitle("Close", for: .normal)
        $0.backgroundColor = .green
        $0.addTarget(self, action: #selector(didTappedCloseButton), for: .touchUpInside)
        return $0
    }(UIButton())
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(holderView)
        
        holderView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(20.0)
            maker.trailing.equalToSuperview().offset(-20.0)
            maker.top.equalToSuperview().offset(200.0)
            maker.height.equalTo(300.0)
        }
        
        holderView.addSubview(labelView)
        
        labelView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(20.0)
            maker.trailing.equalToSuperview().offset(-20.0)
            maker.top.equalToSuperview().offset(10.0)
        }
        
        holderView.addSubview(buttonView)
        
        buttonView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(20.0)
            maker.trailing.equalToSuperview().offset(-20.0)
            maker.bottom.equalToSuperview().offset(-20.0)
        }
        
    }
    
    


}



