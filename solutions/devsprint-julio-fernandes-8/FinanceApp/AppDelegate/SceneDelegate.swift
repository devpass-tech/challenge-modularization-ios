import UIKit
import Swinject
import Components
import HomeInterface
import TransfersInterface

import HomeAssembly
import UserProfileAssembly
import ActivityDetailsAssembly
import TransfersAssembly
import ConfirmationAssembly
import ContactListAssembly

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    var assembler: Assembler = {
        let assembler = Assembler(
            [
                ActivityDetailsAssembly(),
                ConfirmationAssembly(),
                ContactListAssembly(),
                HomeAssembly(),
                TransfersAssembly(),
                UserProfileAssembly()
            ]
        )
        return assembler
    }()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let homeFactory = assembler.resolver.resolve(HomeInterface.self)
        let homeController = homeFactory?.buildViewController() ?? UIViewController()
        
        let transferFactory = assembler.resolver.resolve(TransfersInterface.self)
        let transferController = transferFactory?.buildViewController() ?? UIViewController()
        
        let tabBar = TabBarController(viewController: homeController, title: "Home", nameIcon: "house.fill", tag: 0)
        tabBar.addTabBar(viewController: transferController, title: "Trans", nameIcon: "arrow.up.arrow.down", tag: 1)

        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = UINavigationController(rootViewController: tabBar)
        self.window?.windowScene = windowScene
        self.window?.makeKeyAndVisible()
    }
}
