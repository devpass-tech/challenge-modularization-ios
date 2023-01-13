import UIKit
import Swinject
import Transfers
import Components
import HomeAssembly
import HomeInterface
import UserProfileAssembly
import ActivityDetailsAssembly

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    var assembler: Assembler = {
        let assembler = Assembler(
            [
                UserProfileAssembly(),
                ActivityDetailsAssembly(),
                HomeAssembly()
            ]
        )
        return assembler
    }()
    
    

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let factory = assembler.resolver.resolve(HomeInterface.self)
        let homeController = factory?.buildViewController() ?? UIViewController()
        let transferController = TransfersViewController()
        
        
        let tabBar = TabBarController(viewController: homeController, title: "Home", nameIcon: "house.fill", tag: 0)
        tabBar.addTabBar(viewController: transferController, title: "Trans", nameIcon: "arrow.up.arrow.down", tag: 1)

        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = UINavigationController(rootViewController: tabBar)
        self.window?.windowScene = windowScene
        self.window?.makeKeyAndVisible()
    }
}
