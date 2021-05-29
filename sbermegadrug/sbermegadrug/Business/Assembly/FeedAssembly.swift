//
//  FeedAssembly.swift
//  sbermegadrug
//
//  Created by Ванурин Алексей Максимович on 29.05.2021.
//

import Foundation
import Swinject

final class FeedAssembly: Assembly {
    
    func assemble(container: Container) {
        registerFeedViewContoller(container)
    }
    
}


private extension FeedAssembly {
    
    func registerFeedViewContoller(_ container: Container) {
        container.register(FeedViewController.self) { resolver in
            let vc = FeedViewController()
            
            return vc
        }
    }
    
}
