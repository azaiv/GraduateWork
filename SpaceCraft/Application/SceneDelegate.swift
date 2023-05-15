//
//  SceneDelegate.swift
//  SpaceCraft
//
//  Created by aiv on 20.04.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        
        let vc = UINavigationController(rootViewController: MainPageViewController())
        vc.navigationBar.tintColor = .white
        vc.navigationBar.backgroundColor = .init(named: "BackgroundColor")
        vc.navigationBar.isTranslucent = false
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }
}

