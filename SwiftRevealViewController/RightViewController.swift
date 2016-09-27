//
//  RightViewController.swift
//  SwiftRevealViewController
//
//  Created by Kristijan Kontus on 23/09/2016.
//  Copyright © 2016 kkontus. All rights reserved.
//

import UIKit

enum RightMenu: Int {
    case View = 0
    case OneRight
}

protocol RightMenuProtocol : class {
    func changeViewController(menu: RightMenu)
}

class RightViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, RightMenuProtocol {
    @IBOutlet weak var tableView: UITableView!
    var mainViewController: UIViewController!
    var oneRightViewController: UIViewController!
    let menus = ["View", "PhotoRight"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.revealViewController().rightViewRevealWidth = UIScreen.main.bounds.size.width - 70
        self.revealViewController().rightViewRevealOverdraw = 0
        self.revealViewController().rightViewRevealDisplacement = 0
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let mainViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.mainViewController = UINavigationController(rootViewController: mainViewController)
        
        let oneRightViewController = storyboard.instantiateViewController(withIdentifier: "OneRightViewController") as! OneRightViewController
        self.oneRightViewController = UINavigationController(rootViewController: oneRightViewController)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.tableFooterView = UIView(frame: CGRect.zero) //IMPORTANT: this hides empty cells (and cell separators)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITableViewDataSource, UITableViewDelegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let menu = RightMenu(rawValue: indexPath.item) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = menus[indexPath.row]
            
            switch menu {
            case .View:
                //you can add some cell costumisation here
                cell.backgroundColor = UIColor.lightGray
                cell.isUserInteractionEnabled = true
                return cell
            case .OneRight:
                //you can add some cell costumisation here
                cell.backgroundColor = UIColor.lightGray
                cell.isUserInteractionEnabled = true
                return cell
            }
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let menu = RightMenu(rawValue: indexPath.item) {
            self.changeViewController(menu: menu)
            
            switch menu {
            case .View: break
            case .OneRight: break
            }
        }
    }
    
    func changeViewController(menu: RightMenu) {
        switch menu {
        case .View:
            self.revealViewController().pushFrontViewController(self.mainViewController, animated: true)
            break
        case .OneRight:
            self.revealViewController().pushFrontViewController(self.oneRightViewController, animated: true)
            break
        }
    }
    
}

