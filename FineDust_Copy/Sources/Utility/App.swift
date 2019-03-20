//
//  App.swift
//  FineDust_Copy
//
//  Created by 승진김 on 14/03/2019.
//  Copyright © 2019 승진김. All rights reserved.
//

import UIKit

struct App {

    static let delegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
}

extension App {
    
    enum Constant: String {
        case updateRegion
    }
}

// OS Target Height
extension App {
    
    struct Device {
        static let isIPhoneSE: Bool = UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone && UIScreen.main.nativeBounds.size.height == 1136.0
        static let isIPhone: Bool = UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone && UIScreen.main.nativeBounds.size.height == 1334.0
        static let isIPhonePlus: Bool = (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone && UIScreen.main.nativeBounds.size.height == 2208.0) || (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone && UIScreen.main.nativeBounds.size.height == 1920.0)
        static let isIPhoneX: Bool = UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone && UIScreen.main.nativeBounds.size.height == 2436.0
        static let isIPhoneXr: Bool = UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone && UIScreen.main.nativeBounds.size.height == 1792.0
        static let isIPhoneXsMax: Bool = UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone && UIScreen.main.nativeBounds.size.height == 2688.0
    }
}
