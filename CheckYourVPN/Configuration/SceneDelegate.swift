//
//  SceneDelegate.swift
//  CheckYourVPN
//
//  Created by Denis Denisov on 15/3/24.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.color]
        tabBarAppearance.stackedLayoutAppearance.selected.iconColor = .color
        UITabBar.appearance().standardAppearance = tabBarAppearance
        
        
        UINavigationBar.appearance().tintColor = UIColor.color
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.color]

    }
    
}

