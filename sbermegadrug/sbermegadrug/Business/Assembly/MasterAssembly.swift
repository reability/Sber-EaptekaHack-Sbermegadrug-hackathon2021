//
//  MasterAssembly.swift
//  sbermegadrug
//
//  Created by Ванурин Алексей Максимович on 29.05.2021.
//

import Foundation
import Swinject

final class MasterAssembly: Assembly {
    
    func assemble(container: Container) {
        registerMasterView(container)
    }
    
}

private extension MasterAssembly {
    
    func registerMasterView(_ container: Container) {
        container.register(MasterView.self) { resolver in
            
            let feedViewController = resolver.resolve(FeedViewController.self)
            let tabBarPullUp = TabPullUp()
            feedViewController?.tabPullUp = tabBarPullUp
            feedViewController?.prepare(tabBarPullUp)
            
            let navigationVontroller = MasterViewController(rootViewController: feedViewController!)
            
            return navigationVontroller
        }
    }
    
}
