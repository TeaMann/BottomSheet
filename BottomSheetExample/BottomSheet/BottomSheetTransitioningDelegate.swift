import UIKit

final class BottomSheetTransitioningDelegate: NSObject {
    
    // MARK: Internal properties
    
    let transition: BottomSheetTransition
    
    // MARK: Private properties
    
    private let configuration: BottomSheetConfiguration
    
    // MARK: Init
    
    init(configuration: BottomSheetConfiguration) {
        self.configuration = configuration
        self.transition = BottomSheetTransition(configuration: configuration)
    }
}

// MARK: - UIViewControllerTransitioningDelegate
    
extension BottomSheetTransitioningDelegate: UIViewControllerTransitioningDelegate {
    
    func animationController(
        forPresented presented: UIViewController,
        presenting: UIViewController,
        source: UIViewController
    ) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        transition.wantsInteractiveStart = false
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        transition.isPresenting = false
        return transition
    }
    
    func presentationController(
        forPresented presented: UIViewController,
        presenting: UIViewController?,
        source: UIViewController
    ) -> UIPresentationController? {
        BottomSheetPresentationController(presentedViewController: presented,
                                          presenting: presenting,
                                          configuration: configuration)
    }
}
