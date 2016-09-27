//
//  AppDelegate.swift
//  SwiftRevealViewController
//
//  Created by Kristijan Kontus on 23/09/2016.
//  Copyright © 2016 kkontus. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    private func createMenuView() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // mainViewController is actually frontViewController, the first one that you want to show to the user
        let mainViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        let rearViewController = storyboard.instantiateViewController(withIdentifier: "RearViewController") as! RearViewController
        let rightViewController = storyboard.instantiateViewController(withIdentifier: "RightViewController") as! RightViewController
        
        let nvc: UINavigationController = UINavigationController(rootViewController: mainViewController)
        rearViewController.mainViewController = nvc
        rightViewController.mainViewController = nvc
        
        // we can also initialize like this, but since we have example with rightViewController we can use SWRevealViewController()
        //let swRevealViewController = SWRevealViewController(rearViewController: rearViewController, frontViewController: frontViewControllerNav)
        let swRevealViewController = ContainerSWRevealViewController()
        swRevealViewController.setFront(nvc, animated: true)
        swRevealViewController.setRear(rearViewController, animated: true)
        swRevealViewController.setRight(rightViewController, animated: true)
                
        swRevealViewController.delegate = swRevealViewController
        
        self.window?.rootViewController = swRevealViewController
        self.window?.makeKeyAndVisible()
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.createMenuView()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

