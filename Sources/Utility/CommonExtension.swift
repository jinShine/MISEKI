//
//  CommonExtension.swift
//  FineDust_Copy
//
//  Created by 승진김 on 27/02/1519.
//  Copyright © 1519 승진김. All rights reserved.
//

import UIKit


//MARK:- String To~
extension String {
    var convertValueToStatus: String {
        switch self {
        case "1": return "좋음"
        case "2": return "보통"
        case "3": return "나쁨"
        default : return "매우나쁨"
        }
    }
    
    var convertValueToStateImage: UIImage {
        switch self {
        case "1": return UIImage(named: "State1")!
        case "2": return UIImage(named: "State2")!
        case "3": return UIImage(named: "State3")!
        case "4": return UIImage(named: "State4")!
        default: return UIImage(named: "State5")!
        }
    }
//    (서울, 부산, 대구, 인천, 광주, 대전, 울산, 경기, 강원, 충북, 충남, 전북, 전남, 경북, 경남, 제주, 세종)

    var convertCityShortening: String {
        switch self {
        case "서울특별시": return "서울"
        case "부산광역시": return "부산"
        case "대구광역시": return "대구"
        case "인천광역시": return "인천"
        case "광주광역시": return "광주"
        case "대전광역시": return "대전"
        case "울산광역시": return "울산"
        case "경기도": return "경기"
        case "강원도": return "강원"
        case "충청북도": return "충북"
        case "충청남도": return "충남"
        case "전라북도": return "전북"
        case "전라남도": return "전남"
        case "경상북도": return "경북"
        case "경상남도": return "경남"
        case "제주도": return "제주"
        case "세종특별자치시": return "세종"
        default: return self
        }
    }
    
    var convertGradeToAngelComment: NSMutableAttributedString {
        
        switch self {
        case "1":
            let attributeString = NSMutableAttributedString(string: "\n😇 깨끗한 ",
                                                        attributes: [NSAttributedString.Key.font : FontName.sfBold(25).font,
                                                                     NSAttributedString.Key.foregroundColor : UIColor.fromHexString("#0076FF")])
            attributeString.append(NSMutableAttributedString(string: "공기네요",
                                                             attributes: [NSAttributedString.Key.font : FontName.sfBold(25).font,
                                                                          NSAttributedString.Key.foregroundColor : UIColor.black]))
            return attributeString
        case "2":
            let attributeString = NSMutableAttributedString(string: "😇 다소 나쁜 공기!\n",
                                                        attributes: [NSAttributedString.Key.font : FontName.sfBold(20).font,
                                                                     NSAttributedString.Key.foregroundColor : UIColor.black])
            attributeString.append(NSMutableAttributedString(string: "어린이, 노인, 노약자",
                                                             attributes: [NSAttributedString.Key.font : FontName.sfBold(15).font,
                                                                          NSAttributedString.Key.foregroundColor : UIColor.fromHexString("#0076FF")]))
            
            attributeString.append(NSMutableAttributedString(string: "등\n무리한 실외활동 자제해주세요",
                                                             attributes: [NSAttributedString.Key.font : FontName.sfBold(15).font,
                                                                          NSAttributedString.Key.foregroundColor : UIColor.black]))
            return attributeString
        case "3":
            let attributeString = NSMutableAttributedString(string: "😇 아주 나쁜 공기!\n",
                                                        attributes: [NSAttributedString.Key.font : FontName.sfBold(20).font,
                                                                     NSAttributedString.Key.foregroundColor : UIColor.black])
            attributeString.append(NSMutableAttributedString(string: "어린이, 노인, 노약자",
                                                             attributes: [NSAttributedString.Key.font : FontName.sfBold(17).font,
                                                                          NSAttributedString.Key.foregroundColor : UIColor.fromHexString("#0076FF")]))
                
            attributeString.append(NSMutableAttributedString(string: "등\n실외활동 제한해주세요!",
                                                             attributes: [NSAttributedString.Key.font : FontName.sfBold(17).font,
                                                                          NSAttributedString.Key.foregroundColor : UIColor.black]))
            return attributeString
        default:
            let attributeString = NSMutableAttributedString(string: "😇 최악의 공기!\n",
                                                        attributes: [NSAttributedString.Key.font : FontName.sfBold(20).font,
                                                                     NSAttributedString.Key.foregroundColor : UIColor.black])
            attributeString.append(NSMutableAttributedString(string: "어린이, 노인, 노약자",
                                                             attributes: [NSAttributedString.Key.font : FontName.sfBold(17).font,
                                                                          NSAttributedString.Key.foregroundColor : UIColor.fromHexString("#0076FF")]))
            
            attributeString.append(NSMutableAttributedString(string: "등\n나가지 마세요!",
                                                             attributes: [NSAttributedString.Key.font : FontName.sfBold(17).font,
                                                                          NSAttributedString.Key.foregroundColor : UIColor.black]))
            return attributeString
            
        }
    }
    
    var convertGradeToDevilComment: NSMutableAttributedString {
        
        switch self {
        case "1":
            let attributeString = NSMutableAttributedString(string: "\n흥 ㅡㅡ 👿",
                                                            attributes: [NSAttributedString.Key.font : FontName.sfBold(25).font,
                                                                         NSAttributedString.Key.foregroundColor : UIColor.black])
            return attributeString
        case "2":
            let attributeString = NSMutableAttributedString(string: "이 정도는 ",
                                                            attributes: [NSAttributedString.Key.font : FontName.sfBold(15).font,
                                                                         NSAttributedString.Key.foregroundColor : UIColor.black])
            attributeString.append(NSMutableAttributedString(string: "마스크 ",
                                                             attributes: [NSAttributedString.Key.font : FontName.sfBold(15).font,
                                                                          NSAttributedString.Key.foregroundColor : UIColor(white: 0, alpha: 0.5)]))
            attributeString.append(NSMutableAttributedString(string: "꼭\n",
                                                             attributes: [NSAttributedString.Key.font : FontName.sfBold(15).font,
                                                                          NSAttributedString.Key.foregroundColor : UIColor.black]))
            
            attributeString.append(NSMutableAttributedString(string: "착용 안해도 되잖아? 👿",
                                                             attributes: [NSAttributedString.Key.font : FontName.sfBold(15).font,
                                                                          NSAttributedString.Key.foregroundColor : UIColor.black]))
            return attributeString
        case "3":
            let attributeString = NSMutableAttributedString(string: "나가서",
                                                            attributes: [NSAttributedString.Key.font : FontName.sfBold(17).font,
                                                                         NSAttributedString.Key.foregroundColor : UIColor(white: 0, alpha: 0.5)])
            attributeString.append(NSMutableAttributedString(string: " 놀자! 뭐 어때~ 👿",
                                                             attributes: [NSAttributedString.Key.font : FontName.sfBold(17).font,
                                                                          NSAttributedString.Key.foregroundColor : UIColor.black]))
            return attributeString
        default:
            let attributeString = NSMutableAttributedString(string: "실외 활동",
                                                            attributes: [NSAttributedString.Key.font : FontName.sfBold(17).font,
                                                                         NSAttributedString.Key.foregroundColor : UIColor(white: 0, alpha: 0.5)])
            attributeString.append(NSMutableAttributedString(string: "하기 최고의 날씨~ 👿",
                                                             attributes: [NSAttributedString.Key.font : FontName.sfBold(17).font,
                                                                          NSAttributedString.Key.foregroundColor : UIColor.black]))
            return attributeString
            
        }
    }
    
    
}


//MARK:- Change Color
extension UIColor {
    
    public convenience init(red: Int, green: Int, blue: Int, a: Int = 255) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0,
                  green: CGFloat(green) / 255.0,
                  blue: CGFloat(blue) / 255.0,
                  alpha: CGFloat(a) / 255.0)
    }
    
    public convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
    public static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
    
    public static func fromHexString(_ rgbHex: String) -> UIColor {
        let c2i = { "0123456789ABCDEF".index(of: $0)?.encodedOffset ?? 0 }
        let hexValue = rgbHex.uppercased().map(c2i).reduce(0, { val, i in val * 16 + i })
        return UIColor(rgb: hexValue)
    }
    
    static var mainColor: UIColor {
        return UIColor.fromHexString("#0076FF")
    }
}
