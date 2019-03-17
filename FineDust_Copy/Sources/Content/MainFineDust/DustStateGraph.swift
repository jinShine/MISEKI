//
//  DustStateGraph.swift
//  FineDust_Copy
//
//  Created by 승진김 on 16/03/2019.
//  Copyright © 2019 승진김. All rights reserved.
//

import UIKit
import fluid_slider

final class DustStateGraph: UITableViewCell {
    
//
//    let dustStateSlider: UISlider = {
//        let slider = UISlider()
//
//        return slider
//    }()
//
//    let niceView: UIView = {
//        let view = UIView()
//        view.backgroundColor = UIColor.rgb(red: 0, green: 118, blue: 255, alpha: 1)
//        return view
//    }()
//
//    let normalView: UIView = {
//        let view = UIView()
//        view.backgroundColor = UIColor.rgb(red: 0, green: 118, blue: 255, alpha: 1)
//        return view
//    }()
//
//    let badView: UIView = {
//        let view = UIView()
//        view.backgroundColor = UIColor.rgb(red: 0, green: 118, blue: 255, alpha: 1)
//        return view
//    }()
//
//    let veryBadView: UIView = {
//        let view = UIView()
//        view.backgroundColor = UIColor.rgb(red: 0, green: 118, blue: 255, alpha: 1)
//        return view
//    }()
//
//    let stateStackView: UIStackView = {
//        let stackView = UIStackView()
//        return stackView
//    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let slider = Slider()
        slider.attributedTextForFraction = { fraction in
            let formatter = NumberFormatter()
            formatter.maximumIntegerDigits = 3
            formatter.maximumFractionDigits = 0
            let string = formatter.string(from: (fraction * 500) as NSNumber) ?? ""
            return NSAttributedString(string: string)
        }
        slider.setMinimumLabelAttributedText(NSAttributedString(string: "0"))
        slider.setMaximumLabelAttributedText(NSAttributedString(string: "500"))
        slider.fraction = 0.5
        slider.shadowOffset = CGSize(width: 0, height: 10)
        slider.shadowBlur = 5
        slider.shadowColor = UIColor(white: 0, alpha: 0.1)
        slider.contentViewColor = UIColor(red: 78/255.0, green: 77/255.0, blue: 224/255.0, alpha: 1)
        slider.valueViewColor = .white
        addSubview(slider)
        
//        slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
