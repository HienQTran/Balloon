//
//  BLPopupViewController.swift
//  Balloon
//
//  Created by Hien Quang Tran on 16/12/17.
//  Copyright © 2017 com.hienquangtran.balloon. All rights reserved.
//

import UIKit

public class BLPopupViewController: UIViewController {
    
    private let popupView: UIView
    private let popupSize: CGSize
    
    var presentAnimationTransitioning = BLSlideInFromRightTransitioning()
    var dismissAnimationTransitioning = BLSlideOutToLeftTransitioning()
    
    var isConvenientDismissEnable = true
    
    var backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5) //black 0.5 opaque
    
    init(popupView: UIView) {
        self.popupView = popupView
        self.popupSize = popupView.frame.size
        
        super.init(nibName: nil, bundle: nil)
        
        modalPresentationStyle = .custom
        transitioningDelegate = self
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        if isConvenientDismissEnable {
            let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(close))
            gestureRecognizer.cancelsTouchesInView = false
            self.view.addGestureRecognizer(gestureRecognizer)
        }
        
//        gestureRecognizer.delegate = self

        self.view.addSubview(popupView)
        makeConstraints()
    }
    
    func makeConstraints() {
        popupView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            popupView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            popupView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            popupView.heightAnchor.constraint(equalToConstant: popupSize.height),
            popupView.widthAnchor.constraint(equalToConstant: popupSize.width),
        ])
    }
    
    /// Dismiss the popup
    @objc func close() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension BLPopupViewController: UIViewControllerTransitioningDelegate {
    public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let dimmingPresentationController = BLDimmingPresentationController(presentedViewController: presented, presenting: presenting)
        dimmingPresentationController.transparentView.backgroundColor = backgroundColor
        return dimmingPresentationController
    }
    
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return presentAnimationTransitioning
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return dismissAnimationTransitioning
    }
}
