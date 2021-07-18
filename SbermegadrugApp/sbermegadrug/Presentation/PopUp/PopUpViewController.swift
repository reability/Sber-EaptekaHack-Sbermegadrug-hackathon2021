//
//  PopUpViewController.swift
//  EaptekaAPP
//
//  Created by Sergey Vanurin on 28.05.2021.
//

import Foundation
import UIKit

final class PopUpViewController: UIViewController {

    
    lazy private var holderView: UIView = {
        $0.backgroundColor = .white
        
        $0.layer.cornerRadius = 10.0
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 1
        $0.layer.shadowOffset = .zero
        $0.layer.shadowRadius = 4

        
        return $0
    }(UIView())
    
    lazy private var progressBar: UIProgressView = {
        $0.setProgress(1.0/3.0, animated: true)
        return $0
    }(UIProgressView())
    
    lazy private var headerTileLabel: UILabel = {
        $0.textAlignment = .center
        $0.text = "2/3 покупок до 200 баллов"
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    lazy private var textTileLabel: UILabel = {
        $0.text = "Еще одна покупка и разблокируется следующий бонус"
        $0.textAlignment = .center
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    lazy private var descriptionTileLabel: UILabel = {
        $0.text = "За покупку 3ого, 5ого, 9ого и 13ого начисляются бонусные баллы"
        $0.textAlignment = .center
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    lazy private var button: UIButton = {
        $0.setTitle("Понятно", for: .normal)
        $0.backgroundColor = .blue
        
        return $0
    }(UIButton())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(holderView)
        holderView.addSubview(headerTileLabel)
        holderView.addSubview(textTileLabel)
        holderView.addSubview(descriptionTileLabel)
        holderView.addSubview(progressBar)
        holderView.addSubview(button)
        
        holderView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(30.0)
            maker.trailing.equalToSuperview().offset(-30.0)
            maker.center.equalToSuperview()
            maker.height.equalTo(190.0)
        }
        
        headerTileLabel.snp.makeConstraints { maker in
            maker.top.equalToSuperview().offset(5.0)
            maker.leading.equalToSuperview()
            maker.trailing.equalToSuperview()
        }
        
        progressBar.snp.makeConstraints { maker in
            maker.top.equalTo(headerTileLabel.snp.bottom)
            maker.leading.equalToSuperview().offset(6.0)
            maker.trailing.equalToSuperview().offset(-3.0)
            maker.height.equalTo(10.0)
        }
        
        textTileLabel.snp.makeConstraints { maker in
            maker.top.equalTo(progressBar.snp.bottom).offset(5.0)
            maker.leading.leading.equalToSuperview().offset(2.0)
            maker.trailing.equalToSuperview().offset(2.0)
        }
        
        descriptionTileLabel.snp.makeConstraints { maker in
            maker.top.equalTo(textTileLabel.snp.bottom).offset(10.0)
            maker.leading.leading.equalToSuperview().offset(2.0)
            maker.trailing.equalToSuperview().offset(2.0)
        }
        
        button.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(30.0)
            maker.trailing.equalToSuperview().offset(-30.0)
            maker.bottom.equalToSuperview().offset(-10.0)
        }
        
        view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.progressBar.setProgress(2.0/3.0, animated: true)
        }
    }
    
    
}
