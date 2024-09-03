import UIKit

public final class BottomSheetTransitioningDelegate: NSObject {
    
    // MARK: Internal properties
    
    let transition: BottomSheetTransition
    
    // MARK: Private properties
    
    private let configuration: BottomSheetConfiguration
    private weak var customDelegate: BottomSheetDelegate?
    
    // MARK: Init
    
    public init(configuration: BottomSheetConfiguration, customDelegate: BottomSheetDelegate? = nil) {
        self.configuration = configuration
        self.customDelegate = customDelegate
        self.transition = BottomSheetTransition(configuration: configuration)
    }
}

// MARK: - UIViewControllerTransitioningDelegate
    
extension BottomSheetTransitioningDelegate: UIViewControllerTransitioningDelegate {
    
    public func animationController(
        forPresented presented: UIViewController,
        presenting: UIViewController,
        source: UIViewController
    ) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        transition.wantsInteractiveStart = false
        return transition
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
    
    public func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        transition.isPresenting = false
        return transition
    }
    
    public func presentationController(
        forPresented presented: UIViewController,
        presenting: UIViewController?,
        source: UIViewController
    ) -> UIPresentationController? {
        BottomSheetPresentationController(presentedViewController: presented,
                                          presenting: presenting,
                                          configuration: configuration,
                                          customDelegate: customDelegate)
    }
}
