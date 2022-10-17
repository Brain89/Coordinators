import GameplayKit.GKState

class DetailState: GKState {
    
    var language: Language?
    var detailCoordinator: DetailCoordinator?
    
    override func didEnter(
        from previousState: GKState?
    ) {
        guard
            let language = language,
            let stateMachine = (stateMachine as? StateMachine)
        else {
            return
        }
        
        let detailCoordinator = DetailCoordinator(
            transitionHandler: stateMachine.transitionHandler,
            language: language
        )
        
        self.detailCoordinator = detailCoordinator
        detailCoordinator.start()
    }
    
    override func isValidNextState(
        _ stateClass: AnyClass
    ) -> Bool {
        stateClass == AllState.self
    }
}
