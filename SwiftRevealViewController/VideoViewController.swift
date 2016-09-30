//
//  VideoViewController.swift
//  SwiftRevealViewController
//
//  Created by Kristijan Kontus on 30/09/2016.
//  Copyright © 2016 kkontus. All rights reserved.
//

import UIKit

class VideoViewController: UIViewController {
    
    required init?(coder aDecoder: NSCoder) {
        print("\(type(of: self)) was allocated")
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        print("\(type(of: self)) was allocated")
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    deinit {
        print("\(type(of: self)) was deallocated")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setNavigationBarItemLeft()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        clearSwRevealViewControllerMenuOptions()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

