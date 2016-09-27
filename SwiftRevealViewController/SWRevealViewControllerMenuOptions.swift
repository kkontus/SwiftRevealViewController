//
//  SWRevealViewControllerMenuOptions.swift
//  SwiftRevealViewController
//
//  Created by Kristijan Kontus on 26/09/2016.
//  Copyright © 2016 kkontus. All rights reserved.
//

class SWRevealViewControllerMenuOptions {
    var hasLeftMenu: Bool?
    var hasRightMenu: Bool?
    
    init(hasLeftMenu: Bool, hasRightMenu: Bool) {
        self.hasLeftMenu = hasLeftMenu
        self.hasRightMenu = hasRightMenu
    }
}
