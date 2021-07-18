//
//  TabPullUpOutput.swift
//  sbermegadrug
//
//  Created by Ванурин Алексей Максимович on 29.05.2021.
//

import UIKit.UIViewController

protocol TabPullUpOutput: AnyObject {
}

extension TabPullUpOutput where Self: UIViewController {
    
    func prepare(_ tabPullUp: TabPullUpInjected) {
        tabPullUp.delegate = self
        
        tabPullUp.modalTransitionStyle = .coverVertical
        tabPullUp.modalPresentationStyle = .overCurrentContext
        
        self.addChild(tabPullUp)
        tabPullUp.setupIn(superView: self.view)
        
        //DispatchQueue.main.async {
            //self.present(tabPullUp, animated: false)
        //}
        
    }
    
}
