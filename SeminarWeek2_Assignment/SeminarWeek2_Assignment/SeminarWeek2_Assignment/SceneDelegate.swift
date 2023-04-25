//
//  SceneDelegate.swift
//  SeminarWeek2_Assignment
//
//  Created by 김동현 on 2023/04/11.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        let navigationController = UINavigationController(rootViewController: StartViewController())
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
       
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {

    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
      
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
       
    }
    
    
}
