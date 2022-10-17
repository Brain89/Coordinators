import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var rootCoordinator: AppCoordinator?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)
        
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        self.window = window
        
        let coordinator = RootCoordinator(transitionHandler: navigationController)
        self.rootCoordinator = coordinator
        
        window.makeKeyAndVisible()
        coordinator.start()
    }
}
