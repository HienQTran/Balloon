//
//  BLDimmingPresentationController.swift
//  Balloon
//
//  Created by Hien Quang Tran on 31/12/17.
//  Copyright © 2017 com.hienquangtran.balloon. All rights reserved.
//

import UIKit

class BLDimmingPresentationController: UIPresentationController {
    
    override var shouldRemovePresentersView: Bool {
        return false
    }
    
    lazy var transparentView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        return view
    }()
    
    override func presentationTransitionWillBegin() {
        guard let containerView = containerView else { return }
        
        transparentView.frame = containerView.bounds
        containerView.insertSubview(transparentView, at: 0)
        
        makeConstraints()
        
        transparentView.alpha = 0.0
        if let coordinator = presentedViewController.transitionCoordinator {
            coordinator.animate(alongsideTransition: { _ in
                self.transparentView.alpha = 1
            }, completion: nil)
        }
    }
    
    override func dismissalTransitionWillBegin() {
        if let coordinator = presentedViewController.transitionCoordinator {
            coordinator.animate(alongsideTransition: { _ in
                self.transparentView.alpha = 0
            }, completion: nil)
        }
    }
    
    func makeConstraints() {
        guard let containerView = containerView else { return }
        transparentView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            transparentView.topAnchor.constraint(equalTo: containerView.topAnchor),
            transparentView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            transparentView.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            transparentView.rightAnchor.constraint(equalTo: containerView.rightAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
}
