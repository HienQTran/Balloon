//
//  BLPopupViewController+Pop.swift
//  Balloon
//
//  Created by Hien Quang Tran on 31/12/17.
//  Copyright © 2017 com.hienquangtran.balloon. All rights reserved.
//

import Foundation
import UIKit

extension BLPopupViewController {
    func pop() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UIViewController()
        window.windowLevel = UIWindowLevelAlert + 1
        
        window.makeKeyAndVisible()
        window.rootViewController?.present(self, animated: true, completion: nil)
    }
}
