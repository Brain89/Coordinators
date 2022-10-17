import UIKit
import GameplayKit.GKStateMachine

class StateMachine: GKStateMachine {
    let transitionHandler: UINavigationController
    
    init(
        transitionHandler: UINavigationController,
        states: [GKState]
    ) {
        self.transitionHandler = transitionHandler
        
        super.init(states: states)
    }
}
