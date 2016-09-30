//
//  UIViewController.swift
//  SwiftRevealViewController
//
//  Created by Kristijan Kontus on 23/09/2016.
//  Copyright © 2016 kkontus. All rights reserved.
//

import UIKit

extension UIViewController {

    static var swRevealViewControllerMenuOptions = [UIViewController: SWRevealViewControllerMenuOptions]()
    
    var swRevealViewControllerMenuOptions: SWRevealViewControllerMenuOptions? {
        get {
            return UIViewController.swRevealViewControllerMenuOptions[self]
        }
        set(value) {
            UIViewController.swRevealViewControllerMenuOptions[self] = value
        }
    }
    
    func clearSwRevealViewControllerMenuOptions() {
        swRevealViewControllerMenuOptions = nil
    }
    
    func setNavigationBarItem() {
        swRevealViewControllerMenuOptions = SWRevealViewControllerMenuOptions(hasLeftMenu: true, hasRightMenu: true)
        
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.rightBarButtonItem = nil
        self.view.removeGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        if self.revealViewController() != nil {
            self.addLeftBarButtonWithImage(UIImage(named: "MenuIcon")!)
            self.addRightBarButtonWithImage(UIImage(named: "MenuIcon")!)
            
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    func removeNavigationBarItem() {
        swRevealViewControllerMenuOptions = SWRevealViewControllerMenuOptions(hasLeftMenu: false, hasRightMenu: false)
        
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.rightBarButtonItem = nil
        self.view.removeGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
    
    func setNavigationBarItemLeft() {
        swRevealViewControllerMenuOptions = SWRevealViewControllerMenuOptions(hasLeftMenu: true, hasRightMenu: false)
        
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.rightBarButtonItem = nil
        self.view.removeGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        if self.revealViewController() != nil {
            self.addLeftBarButtonWithImage(UIImage(named: "MenuIcon")!)
            
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    func removeNavigationBarItemLeft() {
        swRevealViewControllerMenuOptions = SWRevealViewControllerMenuOptions(hasLeftMenu: false, hasRightMenu: false)
        
    }
    
    func setNavigationBarItemRight() {
        swRevealViewControllerMenuOptions = SWRevealViewControllerMenuOptions(hasLeftMenu: false, hasRightMenu: true)
        
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.rightBarButtonItem = nil
        self.view.removeGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        if self.revealViewController() != nil {
            self.addRightBarButtonWithImage(UIImage(named: "MenuIcon")!)
            
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    func removeNavigationBarItemRight() {
        swRevealViewControllerMenuOptions = SWRevealViewControllerMenuOptions(hasLeftMenu: false, hasRightMenu: false)

    }
    
    private func addLeftBarButtonWithImage(_ buttonImage: UIImage) {
        let leftButton: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "MenuIcon")!, style: UIBarButtonItemStyle.plain, target: self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)))
        navigationItem.leftBarButtonItem = leftButton
    }
    
    private func addRightBarButtonWithImage(_ buttonImage: UIImage) {
        let rightButton: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "MenuIcon")!, style: UIBarButtonItemStyle.plain, target: self.revealViewController(), action: #selector(SWRevealViewController.rightRevealToggle(_:)))
        navigationItem.rightBarButtonItem = rightButton
    }
    
}

