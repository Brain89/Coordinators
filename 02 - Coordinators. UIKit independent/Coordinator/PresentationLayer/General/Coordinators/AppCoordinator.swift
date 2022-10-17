import Foundation

protocol AppCoordinator {
    
    var childs: [AppCoordinator] { get set }
}
