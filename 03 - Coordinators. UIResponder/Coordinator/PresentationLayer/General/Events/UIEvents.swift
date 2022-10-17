import UIKit

protocol PresentationEvent {}

protocol EventHandler: AnyObject {
    
    func handleEvent(
        _ event: PresentationEvent
    ) -> PresentationEvent?
}

extension UIResponder {

    func postEvent(_ event: PresentationEvent) {
        var nextEvent: PresentationEvent? = event

        if let self = self as? EventHandler {
            nextEvent = self.handleEvent(event)
        }

        if let event = nextEvent {
            next?.postEvent(event)
        }
    }
}
