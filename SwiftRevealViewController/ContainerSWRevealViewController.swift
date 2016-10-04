//
//  CustomSWRevealViewController.swift
//  SwiftRevealViewController
//
//  Created by Kristijan Kontus on 26/09/2016.
//  Copyright © 2016 kkontus. All rights reserved.
//

class ContainerSWRevealViewController: SWRevealViewController, SWRevealViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        self.tapGestureRecognizer()
        self.panGestureRecognizer()
    }
    
    func revealController(_ revealController: SWRevealViewController!, didMoveTo position: FrontViewPosition) {
        if position == FrontViewPosition.right || position == FrontViewPosition.leftSide {
            self.frontViewController.view.isUserInteractionEnabled = false
        } else {
            self.frontViewController.view.isUserInteractionEnabled = true
            revealController.view.addGestureRecognizer(revealController.panGestureRecognizer())
        }
    }
    
    func revealControllerPanGestureShouldBegin(_ revealController: SWRevealViewController!) -> Bool {
        let position = revealController.frontViewPosition
        
        var isClosed = true
        if position == FrontViewPosition.left {
            isClosed = false
        }
        
        let isLeftGeasture = revealController.panGestureRecognizer().isLeftToRightPanGesture(view: self.view)
        let isRightGeasture = revealController.panGestureRecognizer().isRightToLeftPanGesture(view: self.view)
        
        if let topController = UIApplication.topViewController() {
            
            let hasLeftMenu = topController.swRevealViewControllerMenuOptions?.hasLeftMenu
            let hasRightMenu = topController.swRevealViewControllerMenuOptions?.hasRightMenu
            
            return handleGeastures(hasLeftMenu: hasLeftMenu!, hasRightMenu: hasRightMenu!, isLeftGeasture: isLeftGeasture, isRightGeasture: isRightGeasture, isClosed: isClosed)
            
            /*
            if topController.isKind(of: ViewController.self) {
                let hasLeftMenu = topController.swRevealViewControllerMenuOptions?.hasLeftMenu
                let hasRightMenu = topController.swRevealViewControllerMenuOptions?.hasRightMenu
                
                return handleGeastures(hasLeftMenu: hasLeftMenu!, hasRightMenu: hasRightMenu!, isLeftGeasture: isLeftGeasture, isRightGeasture: isRightGeasture, isClosed: isClosed)
            }
            if topController.isKind(of: PhotoViewController.self) {
                let hasLeftMenu = topController.swRevealViewControllerMenuOptions?.hasLeftMenu
                let hasRightMenu = topController.swRevealViewControllerMenuOptions?.hasRightMenu
                
                return handleGeastures(hasLeftMenu: hasLeftMenu!, hasRightMenu: hasRightMenu!, isLeftGeasture: isLeftGeasture, isRightGeasture: isRightGeasture, isClosed: isClosed)
            }
            if topController.isKind(of: MapViewController.self) {
                let hasLeftMenu = topController.swRevealViewControllerMenuOptions?.hasLeftMenu
                let hasRightMenu = topController.swRevealViewControllerMenuOptions?.hasRightMenu
                
                return handleGeastures(hasLeftMenu: hasLeftMenu!, hasRightMenu: hasRightMenu!, isLeftGeasture: isLeftGeasture, isRightGeasture: isRightGeasture, isClosed: isClosed)
            }
            if topController.isKind(of: BlahViewController.self) {
                let hasLeftMenu = topController.swRevealViewControllerMenuOptions?.hasLeftMenu
                let hasRightMenu = topController.swRevealViewControllerMenuOptions?.hasRightMenu
                
                return handleGeastures(hasLeftMenu: hasLeftMenu!, hasRightMenu: hasRightMenu!, isLeftGeasture: isLeftGeasture, isRightGeasture: isRightGeasture, isClosed: isClosed)
            }
            if topController.isKind(of: VideoViewController.self) {
                let hasLeftMenu = topController.swRevealViewControllerMenuOptions?.hasLeftMenu
                let hasRightMenu = topController.swRevealViewControllerMenuOptions?.hasRightMenu
                
                return handleGeastures(hasLeftMenu: hasLeftMenu!, hasRightMenu: hasRightMenu!, isLeftGeasture: isLeftGeasture, isRightGeasture: isRightGeasture, isClosed: isClosed)
            }
            if topController.isKind(of: OneRightViewController.self) {
                let hasLeftMenu = topController.swRevealViewControllerMenuOptions?.hasLeftMenu
                let hasRightMenu = topController.swRevealViewControllerMenuOptions?.hasRightMenu
                
                return handleGeastures(hasLeftMenu: hasLeftMenu!, hasRightMenu: hasRightMenu!, isLeftGeasture: isLeftGeasture, isRightGeasture: isRightGeasture, isClosed: isClosed)
            }
            */
        }
        
        return true
    }
    
    private func handleGeastures(hasLeftMenu: Bool, hasRightMenu: Bool, isLeftGeasture: Bool, isRightGeasture: Bool, isClosed: Bool) -> Bool {
        // if it has both menues then both pan geastures are allowed
        if hasLeftMenu && hasRightMenu {
            return true
        } else if hasLeftMenu {
            if isLeftGeasture && isClosed { // case when we are opening left menu
                return true
            } else if isRightGeasture && !isClosed { // case when we are closing left menu
                return true
            } else {
                return false
            }
        } else if hasRightMenu {
            if isRightGeasture && isClosed { // case when we are opening right menu
                return true
            } else if isLeftGeasture && !isClosed { // case when we are closing right menu
                return true
            } else {
                return false
            }
        } else {
            return false // disable in all other cases
        }
    }
    
}

