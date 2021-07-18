//
//  TabPullInjection.swift
//  sbermegadrug
//
//  Created by Ванурин Алексей Максимович on 29.05.2021.
//

import UIKit.UIViewController

protocol TabPullUpInjected: UIViewController {
    var delegate: TabPullUpOutput? { get set }
    
    func setupIn(superView: UIView)
}
