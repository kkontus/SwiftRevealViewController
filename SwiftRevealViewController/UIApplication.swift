//
//  UIApplication.swift
//  SwiftRevealViewController
//
//  Created by Kristijan Kontus on 26/09/2016.
//  Copyright © 2016 kkontus. All rights reserved.
//

import UIKit

extension UIApplication {
    
    class func topViewController(viewController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = viewController as? UINavigationController {
            return topViewController(viewController: nav.visibleViewController)
        }
        if let tab = viewController as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(viewController: selected)
            }
        }
        if let presented = viewController?.presentedViewController {
            return topViewController(viewController: presented)
        }
        
        if let reveal = viewController as? SWRevealViewController {
            return topViewController(viewController: reveal.frontViewController)
        }
        
        return viewController
    }
    
}
