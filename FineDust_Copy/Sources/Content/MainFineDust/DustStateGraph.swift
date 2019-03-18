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
    
    struct UI {
        static let basicMargin: CGFloat                 = 16
    }

    //MARK:- UI Properties
    
    let slider: Slider = {
        let slider = Slider()
        slider.attributedTextForFraction = { fraction in
            let formatter = NumberFormatter()
            formatter.maximumIntegerDigits = 3
            formatter.maximumFractionDigits = 0
            let string = formatter.string(from: (fraction * 76) as NSNumber) ?? ""
            return NSAttributedString(string: string)
        }
        slider.setMinimumLabelAttributedText(NSAttributedString(string: "0"))
        slider.setMaximumLabelAttributedText(NSAttributedString(string: "76~"))
        slider.fraction = 0.5
        slider.shadowOffset = CGSize(width: 0, height: 10)
        slider.shadowBlur = 5
        slider.shadowColor = UIColor(white: 0, alpha: 0.1)
        slider.contentViewColor = UIColor(red: 78/255.0, green: 77/255.0, blue: 224/255.0, alpha: 1)
        slider.valueViewColor = .white
        return slider
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupUI()
        
//        slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK:- Setup
    private func setupUI() {
        addSubview(slider)
        slider.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            slider.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -UI.basicMargin),
            slider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: UI.basicMargin),
            slider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -UI.basicMargin),
            slider.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
