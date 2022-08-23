//
//  SceneDelegate.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit
import Sample

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(frame: UIScreen.main.bounds)

        let service = SampleServiceDois()

        let customView = SampleView()
        
        let sampleViewController = SampleViewController(customView: customView, service: service)
        customView.delegate = sampleViewController

        self.window?.rootViewController = UINavigationController(rootViewController: sampleViewController)
        self.window?.windowScene = windowScene
        self.window?.makeKeyAndVisible()
    }
}

