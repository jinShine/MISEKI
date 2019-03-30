//
//  Navigator.swift
//  FineDust_Copy
//
//  Created by 승진김 on 25/03/2019.
//  Copyright © 2019 승진김. All rights reserved.
//

import UIKit

enum Navigator {
    case main
    case searchedAddress
    case sharing(FineDustModel, PlaceMark)
}

extension Navigator {
    var viewController: UIViewController {
        switch self {
        case .main:
            let viewController: MainViewController = MainViewController(fineDustService: FineDustService(), placeMark: PlaceMark())
            return viewController

        case .searchedAddress:
            let viewController: SearchAddressViewController = SearchAddressViewController(addressService: AddressService())
            return viewController
            
        case .sharing(let fineDust, let place):
            let viewController: SharingViewController = SharingViewController(fineDustModel: fineDust, placeMark: place)
            viewController.modalPresentationStyle = .overCurrentContext
            return viewController
            
            
        }
    }
}
