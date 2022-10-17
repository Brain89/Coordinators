import Foundation

protocol AppCoordinator: EventHandler {
    
    var childs: [AppCoordinator] { get set }
}
