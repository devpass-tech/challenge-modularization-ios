import UIKit
import Components
import Home
import Transfers

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let tabBar = TabBarController(viewController: HomeViewController(), title: "Home", nameIcon: "house.fill", tag: 0)
        tabBar.addTabBar(viewController: TransfersViewController(), title: "Trans", nameIcon: "arrow.up.arrow.down", tag: 1)

        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = UINavigationController(rootViewController: tabBar)
        self.window?.windowScene = windowScene
        self.window?.makeKeyAndVisible()
    }
}

