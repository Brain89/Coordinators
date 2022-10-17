import GameplayKit.GKState

class AllState: GKState {
    
    lazy var allCoordinator = makeAllCoordinator()
    
    override func didEnter(from previousState: GKState?) {
        if previousState == nil {
            allCoordinator?.start()
        } else {
            (stateMachine as? StateMachine)?
                .transitionHandler
                .popToRootViewController(
                    animated: true
                )
        }
    }
    
    override func isValidNextState(
        _ stateClass: AnyClass
    ) -> Bool {
        stateClass == DetailState.self
    }
    
    private func makeAllCoordinator() -> AllCoordinator? {
        guard let stateMachine = stateMachine as? StateMachine else {
            return nil
        }
        
        return AllCoordinator(
            transitionHandler: stateMachine.transitionHandler,
            list: Language.make(),
            title: "Список языков"
        )
    }
}
