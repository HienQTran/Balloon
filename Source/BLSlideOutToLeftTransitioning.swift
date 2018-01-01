//
//  BLSlideOutToLeftTransitioning.swift
//  Balloon
//
//  Created by Hien Quang Tran on 16/12/17.
//  Copyright © 2017 com.hienquangtran.balloon. All rights reserved.
//

import UIKit

class BLSlideOutToLeftTransitioning: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.4
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if let fromView = transitionContext.view(forKey: .from) {
            UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
                fromView.frame.origin = CGPoint(x: -UIScreen.main.bounds.width, y: 0)
            }, completion: { finished in
                transitionContext.completeTransition(finished)
            })
        }
    }
}