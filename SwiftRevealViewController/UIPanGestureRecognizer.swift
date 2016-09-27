//
//  UIPanGestureRecognizer.swift
//  SwiftRevealViewController
//
//  Created by Kristijan Kontus on 26/09/2016.
//  Copyright © 2016 kkontus. All rights reserved.
//

import UIKit

extension UIPanGestureRecognizer {
    
    func isLeftToRightPanGesture(view: UIView) -> Bool {
        let velocity : CGPoint = self.velocity(in: view)
        if velocity.x > 0 {
            return false
        } else {
            return true
        }
    }
    
    func isRightToLeftPanGesture(view: UIView) -> Bool {
        let velocity : CGPoint = self.velocity(in: view)
        if velocity.x > 0 {
            return true
        } else {
            return false
        }
    }
    
}
