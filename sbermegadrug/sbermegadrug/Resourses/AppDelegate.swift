//
//  AppDelegate.swift
//  sbermegadrug
//
//  Created by Ванурин Алексей Максимович on 29.05.2021.
//

import UIKit
import Swinject

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let container: Container = {
        let container = Container()
        let assemblies: [Assembly] = [
                MasterAssembly(),
                FeedAssembly(),
            ]
        assemblies.forEach( {$0.assemble(container: container)} )
        return container
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow()
        let masterVC = container.resolve(MasterView.self)
        window?.rootViewController = masterVC
        window?.makeKeyAndVisible()
        
        return true
    }


}

