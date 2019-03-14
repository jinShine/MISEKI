//
//  CurrentLocationCell.swift
//  FineDust_Copy
//
//  Created by 승진김 on 05/03/2019.
//  Copyright © 2019 승진김. All rights reserved.
//

import UIKit

class CurrentLocationCell: UITableViewCell {
    
    struct UI {
        static let leftMargin: CGFloat = 16
        static let basicMargin: CGFloat = 8
        static let currentLocationImageSize: CGFloat = 20
    }
    
    //MARK:- UI Properties
    
    let currentLocationImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Target")
        return imageView
    }()
    
    let currentLocationTitle: UILabel = {
        let label = UILabel()
        label.text = "현재 위치로 설정"
        return label
    }()
    
    
    //MARK:- Properties

    
    //MARK:- Initialize
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //MARK:- Setup
    private func setupUI() {
        
        [currentLocationImage, currentLocationTitle].forEach { addSubview($0) }
        currentLocationImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            currentLocationImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            currentLocationImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: UI.leftMargin),
            currentLocationImage.widthAnchor.constraint(equalToConstant: UI.currentLocationImageSize),
            currentLocationImage.heightAnchor.constraint(equalToConstant: UI.currentLocationImageSize)
        ])
        
        currentLocationTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            currentLocationTitle.centerYAnchor.constraint(equalTo: centerYAnchor),
            currentLocationTitle.leadingAnchor.constraint(equalTo: currentLocationImage.trailingAnchor, constant: UI.basicMargin)
        ])
        
    }
}
