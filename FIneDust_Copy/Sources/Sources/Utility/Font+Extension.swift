//
//  Font+Extension.swift
//  FineDust_Copy
//
//  Created by 승진김 on 15/03/2019.
//  Copyright © 2019 승진김. All rights reserved.
//

import UIKit


//    == SFProDisplay-HeavyItalic
//    == SFProDisplay-ThinItalic
//    == SFProDisplay-Ultralight
//    == SFProDisplay-Heavy
//    == SFProDisplay-BoldItalic
//    == SFProDisplay-SemiboldItalic
//    == SFProDisplay-Regular
//    == SFProDisplay-Bold
//    == SFProDisplay-MediumItalic
//    == SFProDisplay-Thin
//    == SFProDisplay-Semibold
//    == SFProDisplay-BlackItalic
//    == SFProDisplay-Light
//    == SFProDisplay-UltralightItalic
//    == SFProDisplay-Italic
//    == SFProDisplay-LightItalic
//    == SFProDisplay-Black
//    == SFProDisplay-Medium

enum FontName {
    case sfThin(CGFloat)
    case sfRegular(CGFloat)
    case sfMedium(CGFloat)
    case sfBold(CGFloat)
    case sfHeavy(CGFloat)
}

extension FontName {
    var font: UIFont {
        switch self {
        case .sfThin(let size):
            return UIFont(name: "SFProDisplay-Thin", size: size) ?? UIFont.systemFont(ofSize: size)
        case .sfRegular(let size):
            return UIFont(name: "SFProDisplay-Regular", size: size) ?? UIFont.systemFont(ofSize: size)
        case .sfMedium(let size):
            return UIFont(name: "SFProDisplay-Medium", size: size) ?? UIFont.systemFont(ofSize: size)
        case .sfBold(let size):
            return UIFont(name: "SFProDisplay-Bold", size: size) ?? UIFont.systemFont(ofSize: size)
        case .sfHeavy(let size):
            return UIFont(name: "SFProDisplay-Heavy", size: size) ?? UIFont.systemFont(ofSize: size)
        }
    }
}
