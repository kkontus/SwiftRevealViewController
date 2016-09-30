//
//  PhotoViewController.swift
//  SwiftRevealViewController
//
//  Created by Kristijan Kontus on 23/09/2016.
//  Copyright © 2016 kkontus. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    
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

