//
//  BLSlideInFromRightTransitioning.swift
//  Balloon
//
//  Created by Hien Quang Tran on 31/12/17.
//  Copyright © 2017 com.hienquangtran.balloon. All rights reserved.
//

import UIKit

class BLSlideInFromRightTransitioning: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.4
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if let toViewController = transitionContext.viewController(forKey: .to),
            let toView = transitionContext.view(forKey: .to) {
            
            let containerView = transitionContext.containerView
            toView.frame = transitionContext.finalFrame(for: toViewController)
            containerView.addSubview(toView)
            toView.frame.origin = CGPoint(x: UIScreen.main.bounds.size.width, y: 0)
            
            UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
                toView.frame.origin = CGPoint(x: 0, y: 0)
            }, completion: { finished in
                transitionContext.completeTransition(finished)
            })
        }
    }
}
