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
        
        let labelTextAttributes: [NSAttributedString.Key : Any] = [.font: FontName.sfMedium(12).font, .foregroundColor: UIColor.white]
        
        slider.attributedTextForFraction = { fraction in
            let formatter = NumberFormatter()
            formatter.maximumIntegerDigits = 3
            formatter.maximumFractionDigits = 0
            let string = formatter.string(from: (fraction * 130) as NSNumber) ?? ""
            return NSAttributedString(string: string)
        }
        
        slider.setMinimumLabelAttributedText(NSAttributedString(string: "0", attributes: labelTextAttributes))
        slider.setMaximumLabelAttributedText(NSAttributedString(string: "130~", attributes: labelTextAttributes))
        slider.setMinimumImage(UIImage(named: "State2"))
        slider.setMaximumImage(UIImage(named: "State4"))
        slider.fraction = 0.5
        slider.shadowOffset = CGSize(width: 0, height: 10)
        slider.shadowBlur = 5
        slider.shadowColor = UIColor(white: 0, alpha: 0.1)
        slider.contentViewColor = UIColor.fromHexString("#0076FF")
        slider.valueViewColor = .white

        return slider
    }()
    
    let goodTitle: UILabel = {
        let label = UILabel()
        label.text = "좋음\n0"
        label.font = FontName.sfThin(10).font
        label.numberOfLines = 0
        return label
    }()
    
    let normalTitle: UILabel = {
        let label = UILabel()
        label.text = "보통\n16~"
        label.font = FontName.sfThin(10).font
        label.numberOfLines = 0
        return label
    }()
    
    let badTitle: UILabel = {
        let label = UILabel()
        label.text = "나쁨\n36~"
        label.font = FontName.sfThin(10).font
        label.numberOfLines = 0
        return label
    }()
    
    let veryBadTitle: UILabel = {
        let label = UILabel()
        label.text = "매우나쁨\n76~"
        label.font = FontName.sfThin(10).font
        label.numberOfLines = 0
        return label
    }()
    
    
    //MARK:- Initialize

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
        
        [goodTitle, normalTitle, badTitle, veryBadTitle, slider].forEach {
            addSubview($0)
        }

        goodTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            goodTitle.bottomAnchor.constraint(equalTo: slider.topAnchor, constant: -8),
            goodTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: UI.basicMargin)
            ])
        
        normalTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            normalTitle.bottomAnchor.constraint(equalTo: slider.topAnchor, constant: -8),
            normalTitle.leadingAnchor.constraint(equalTo: goodTitle.trailingAnchor, constant: 20)
            ])
        
        badTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            badTitle.bottomAnchor.constraint(equalTo: slider.topAnchor, constant: -8),
            badTitle.centerXAnchor.constraint(equalTo: slider.centerXAnchor, constant: 30)
            ])
        
        veryBadTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            veryBadTitle.bottomAnchor.constraint(equalTo: slider.topAnchor, constant: -8),
            veryBadTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -UI.basicMargin)
        ])
        
        
        slider.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            slider.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -UI.basicMargin),
            slider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: UI.basicMargin),
            slider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -UI.basicMargin),
            slider.heightAnchor.constraint(equalToConstant: 50)
        ])
        

        
        slider.didBeginTracking = { [weak self] slider in
            print("didBeginTracking", slider)
        }
        
        slider.didEndTracking = { [weak self] slider in
            print("didEndTracking", slider)
        }
        
        
    }
    
}
