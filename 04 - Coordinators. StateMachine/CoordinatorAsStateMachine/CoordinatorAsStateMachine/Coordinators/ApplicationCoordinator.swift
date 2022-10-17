import UIKit

class ApplicationCoordinator: Coordinator {
    
    let window: UIWindow
    let rootViewController: UINavigationController
    
    let stateMachine: StateMachine
    
    init(window: UIWindow) {
        self.window = window
        
        rootViewController = UINavigationController()
        rootViewController.navigationBar.prefersLargeTitles = true
        
        stateMachine = StateMachine(
            transitionHandler: rootViewController,
            states: [
                AllState(),
                DetailState()
            ]
        )
    }
    
    func start() {
        stateMachine.enter(AllState.self)
        
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        
        subscribeToNotifications()
    }
    
    func subscribeToNotifications() {
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(receivedAllNotification),
            name: Notifications.All,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(receivedDetailNotification),
            name: Notifications.Detail,
            object: nil
        )
    }
    
    @objc
    func receivedAllNotification() {
        stateMachine.enter(AllState.self)
    }
    
    @objc
    func receivedDetailNotification(notification: NSNotification) {
        guard
            let language = notification.object as? Language,
            let detailState = stateMachine.state(forClass: DetailState.self)
        else {
            return
        }
        
        detailState.language = language
        
        stateMachine.enter(DetailState.self)
    }
    
    @objc
    func receivedListNotification(notification: NSNotification) {
        guard
            let _ = stateMachine.state(forClass: AllState.self)
        else {
            return
        }
        
        // можно передать данные
        
        stateMachine.enter(AllState.self)
    }
}
