//
//  DustDetail.swift
//  FineDust_Copy
//
//  Created by 승진김 on 18/03/2019.
//  Copyright © 2019 승진김. All rights reserved.
//

import UIKit

final class DustDetail: UITableViewCell {
    
    //MARK:- Constant
    
    struct UI {
        static let basicMargin: CGFloat                 = 16
        static let stateImageSize: CGFloat              = 14
        static let detailInfoStackViewHeight: CGFloat   = 80
    }
    
    
    //MARK:- UI Properties
    
    // Main Dust Detail
    
    let updateTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "업데이트"
        label.font = FontName.sfBold(20).font
        return label
    }()
    
    let updateValueLabel: UILabel = {
        let label = UILabel()
        label.text = " - "
        label.font = FontName.sfMedium(20).font
        return label
    }()
    
    
    
    //미세먼지
    let fineDustContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    let fineDustStateImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let fineDustStateTitle: UILabel = {
        let label = UILabel()
        label.text = "미세먼지"
        label.textColor = UIColor.rgb(red: 0, green: 0, blue: 0, alpha: 0.5)
        label.font = FontName.sfBold(17).font
        return label
    }()
    
    let fineDustStateValue: UILabel = {
        let label = UILabel()
        label.text = " - "
        label.textColor = .black
        label.textAlignment = .right
        label.font = FontName.sfBold(17).font
        return label
    }()
    
    //초미세먼지
    let ultrafineDustContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var ultrafineDustStateImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let ultrafineDustStateTitle: UILabel = {
        let label = UILabel()
        label.text = "초미세먼지"
        label.textColor = UIColor.rgb(red: 0, green: 0, blue: 0, alpha: 0.5)
        label.font = FontName.sfBold(17).font
        return label
    }()
    
    let ultrafineDustStateValue: UILabel = {
        let label = UILabel()
        label.text = " - "
        label.textColor = .black
        label.textAlignment = .right
        label.font = FontName.sfBold(17).font
        return label
    }()
    
    //이산화질소
    let nitrogenDioxideContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    let nitrogenDioxideStateImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let nitrogenDioxideStateTitle: UILabel = {
        let label = UILabel()
        label.text = "이산화질소"
        label.textColor = UIColor.rgb(red: 0, green: 0, blue: 0, alpha: 0.5)
        label.font = FontName.sfBold(17).font
        return label
    }()
    
    let nitrogenDioxideStateValue: UILabel = {
        let label = UILabel()
        label.text = " - "
        label.textColor = .black
        label.textAlignment = .right
        label.font = FontName.sfBold(17).font
        return label
    }()
    
    //오존
    let ozoneContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    let ozoneStateImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let ozoneStateTitle: UILabel = {
        let label = UILabel()
        label.text = "오존"
        label.textColor = UIColor.rgb(red: 0, green: 0, blue: 0, alpha: 0.5)
        label.font = FontName.sfBold(17).font
        return label
    }()
    
    let ozoneStateValue: UILabel = {
        let label = UILabel()
        label.text = " - "
        label.textColor = .black
        label.textAlignment = .right
        label.font = FontName.sfBold(17).font
        return label
    }()
    
    //일산화탄소
    let carbonMonoxideContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    let carbonMonoxideStateImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let carbonMonoxideStateTitle: UILabel = {
        let label = UILabel()
        label.text = "일산화탄소"
        label.textColor = UIColor.rgb(red: 0, green: 0, blue: 0, alpha: 0.5)
        label.font = FontName.sfBold(17).font
        return label
    }()
    
    let carbonMonoxideStateValue: UILabel = {
        let label = UILabel()
        label.text = " - "
        label.textColor = .black
        label.textAlignment = .right
        label.font = FontName.sfBold(17).font
        return label
    }()
    
    //아황산가스
    let sulfurDioxideContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    let sulfurDioxideStateImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let sulfurDioxideStateTitle: UILabel = {
        let label = UILabel()
        label.text = "아황산가스"
        label.textColor = UIColor.rgb(red: 0, green: 0, blue: 0, alpha: 0.5)
        label.font = FontName.sfBold(17).font
        return label
    }()
    
    let sulfurDioxideStateValue: UILabel = {
        let label = UILabel()
        label.text = " - "
        label.textColor = .black
        label.textAlignment = .right
        label.font = FontName.sfBold(17).font
        return label
    }()
    
    lazy var leftInnerStackView = UIStackView(arrangedSubviews:
        [fineDustContainer, ultrafineDustContainer, nitrogenDioxideContainer]
    )
    lazy var rightInnerStackView = UIStackView(arrangedSubviews:
        [ozoneContainer, carbonMonoxideContainer, sulfurDioxideContainer]
    )
    lazy var detailStateContainerStackView = UIStackView(arrangedSubviews:
        [leftInnerStackView, rightInnerStackView]
    )
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK:- Setup
    
    private func setupUI() {

        [updateTitleLabel, updateValueLabel, detailStateContainerStackView].forEach {
            addSubview($0)
        }
        
        [fineDustStateImage, fineDustStateTitle, fineDustStateValue].forEach { fineDustContainer.addSubview($0) }
        [ultrafineDustStateImage, ultrafineDustStateTitle, ultrafineDustStateValue].forEach { ultrafineDustContainer.addSubview($0) }
        [nitrogenDioxideStateImage, nitrogenDioxideStateTitle, nitrogenDioxideStateValue].forEach { nitrogenDioxideContainer.addSubview($0) }
        [ozoneStateImage, ozoneStateTitle, ozoneStateValue].forEach { ozoneContainer.addSubview($0) }
        [carbonMonoxideStateImage, carbonMonoxideStateTitle, carbonMonoxideStateValue].forEach { carbonMonoxideContainer.addSubview($0) }
        [sulfurDioxideStateImage, sulfurDioxideStateTitle, sulfurDioxideStateValue].forEach { sulfurDioxideContainer.addSubview($0) }
        
        
        // 업데이트
        updateTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            updateTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: UI.basicMargin),
            updateTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: UI.basicMargin)
        ])
        
        updateValueLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            updateValueLabel.centerYAnchor.constraint(equalTo: updateTitleLabel.centerYAnchor),
            updateValueLabel.leadingAnchor.constraint(equalTo: updateTitleLabel.trailingAnchor, constant: UI.basicMargin),
            updateValueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -UI.basicMargin)
        ])
        
        
        /////Detail
        fineDustStateImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fineDustStateImage.centerYAnchor.constraint(equalTo: fineDustContainer.centerYAnchor),
            fineDustStateImage.leadingAnchor.constraint(equalTo: fineDustContainer.leadingAnchor, constant: 0),
            fineDustStateImage.heightAnchor.constraint(equalToConstant: UI.stateImageSize),
            fineDustStateImage.widthAnchor.constraint(equalToConstant: UI.stateImageSize)
            ])
        fineDustStateImage.layer.cornerRadius = UI.stateImageSize / 2
        fineDustStateImage.layer.masksToBounds = true
        
        fineDustStateTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fineDustStateTitle.centerYAnchor.constraint(equalTo: fineDustContainer.centerYAnchor),
            fineDustStateTitle.leadingAnchor.constraint(equalTo: fineDustStateImage.trailingAnchor, constant: 6)
            ])
        
        fineDustStateValue.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fineDustStateValue.centerYAnchor.constraint(equalTo: fineDustContainer.centerYAnchor),
            fineDustStateValue.leadingAnchor.constraint(equalTo: fineDustStateTitle.trailingAnchor, constant: UI.basicMargin),
            fineDustStateValue.trailingAnchor.constraint(equalTo: fineDustContainer.trailingAnchor)
            ])
        
        
        ultrafineDustStateImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ultrafineDustStateImage.centerYAnchor.constraint(equalTo: ultrafineDustContainer.centerYAnchor),
            ultrafineDustStateImage.leadingAnchor.constraint(equalTo: ultrafineDustContainer.leadingAnchor),
            ultrafineDustStateImage.heightAnchor.constraint(equalToConstant: UI.stateImageSize),
            ultrafineDustStateImage.widthAnchor.constraint(equalToConstant: UI.stateImageSize)
            ])
        ultrafineDustStateImage.layer.cornerRadius = UI.stateImageSize / 2
        ultrafineDustStateImage.layer.masksToBounds = true
        
        ultrafineDustStateTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ultrafineDustStateTitle.centerYAnchor.constraint(equalTo: ultrafineDustContainer.centerYAnchor),
            ultrafineDustStateTitle.leadingAnchor.constraint(equalTo: ultrafineDustStateImage.trailingAnchor, constant: 6)
            ])
        
        ultrafineDustStateValue.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ultrafineDustStateValue.centerYAnchor.constraint(equalTo: ultrafineDustContainer.centerYAnchor),
            ultrafineDustStateValue.leadingAnchor.constraint(equalTo: ultrafineDustStateTitle.trailingAnchor, constant: UI.basicMargin),
            ultrafineDustStateValue.trailingAnchor.constraint(equalTo: ultrafineDustContainer.trailingAnchor)
            ])
        
        
        nitrogenDioxideStateImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nitrogenDioxideStateImage.centerYAnchor.constraint(equalTo: nitrogenDioxideContainer.centerYAnchor),
            nitrogenDioxideStateImage.leadingAnchor.constraint(equalTo: nitrogenDioxideContainer.leadingAnchor),
            nitrogenDioxideStateImage.heightAnchor.constraint(equalToConstant: UI.stateImageSize),
            nitrogenDioxideStateImage.widthAnchor.constraint(equalToConstant: UI.stateImageSize)
            ])
        nitrogenDioxideStateImage.layer.cornerRadius = UI.stateImageSize / 2
        nitrogenDioxideStateImage.layer.masksToBounds = true
        
        nitrogenDioxideStateTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nitrogenDioxideStateTitle.centerYAnchor.constraint(equalTo: nitrogenDioxideContainer.centerYAnchor),
            nitrogenDioxideStateTitle.leadingAnchor.constraint(equalTo: nitrogenDioxideStateImage.trailingAnchor, constant: 6)
            ])
        
        nitrogenDioxideStateValue.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nitrogenDioxideStateValue.centerYAnchor.constraint(equalTo: nitrogenDioxideContainer.centerYAnchor),
            nitrogenDioxideStateValue.leadingAnchor.constraint(equalTo: nitrogenDioxideStateTitle.trailingAnchor, constant: UI.basicMargin),
            nitrogenDioxideStateValue.trailingAnchor.constraint(equalTo: nitrogenDioxideContainer.trailingAnchor)
            ])
        
        ozoneStateImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ozoneStateImage.centerYAnchor.constraint(equalTo: ozoneContainer.centerYAnchor),
            ozoneStateImage.leadingAnchor.constraint(equalTo: ozoneContainer.leadingAnchor),
            ozoneStateImage.heightAnchor.constraint(equalToConstant: UI.stateImageSize),
            ozoneStateImage.widthAnchor.constraint(equalToConstant: UI.stateImageSize)
            ])
        ozoneStateImage.layer.cornerRadius = UI.stateImageSize / 2
        ozoneStateImage.layer.masksToBounds = true
        
        ozoneStateTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ozoneStateTitle.centerYAnchor.constraint(equalTo: ozoneContainer.centerYAnchor),
            ozoneStateTitle.leadingAnchor.constraint(equalTo: ozoneStateImage.trailingAnchor, constant: 6)
            ])
        
        ozoneStateValue.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ozoneStateValue.centerYAnchor.constraint(equalTo: ozoneContainer.centerYAnchor),
            ozoneStateValue.leadingAnchor.constraint(equalTo: ozoneStateTitle.trailingAnchor, constant: UI.basicMargin),
            ozoneStateValue.trailingAnchor.constraint(equalTo: ozoneContainer.trailingAnchor)
            ])
        
        
        carbonMonoxideStateImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            carbonMonoxideStateImage.centerYAnchor.constraint(equalTo: carbonMonoxideContainer.centerYAnchor),
            carbonMonoxideStateImage.leadingAnchor.constraint(equalTo: carbonMonoxideContainer.leadingAnchor),
            carbonMonoxideStateImage.heightAnchor.constraint(equalToConstant: UI.stateImageSize),
            carbonMonoxideStateImage.widthAnchor.constraint(equalToConstant: UI.stateImageSize)
            ])
        carbonMonoxideStateImage.layer.cornerRadius = UI.stateImageSize / 2
        carbonMonoxideStateImage.layer.masksToBounds = true
        
        carbonMonoxideStateTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            carbonMonoxideStateTitle.centerYAnchor.constraint(equalTo: carbonMonoxideContainer.centerYAnchor),
            carbonMonoxideStateTitle.leadingAnchor.constraint(equalTo: carbonMonoxideStateImage.trailingAnchor, constant: 6)
            ])
        
        carbonMonoxideStateValue.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            carbonMonoxideStateValue.centerYAnchor.constraint(equalTo: carbonMonoxideContainer.centerYAnchor),
            carbonMonoxideStateValue.leadingAnchor.constraint(equalTo: carbonMonoxideStateTitle.trailingAnchor, constant: UI.basicMargin),
            carbonMonoxideStateValue.trailingAnchor.constraint(equalTo: carbonMonoxideContainer.trailingAnchor)
            ])
        
        
        sulfurDioxideStateImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sulfurDioxideStateImage.centerYAnchor.constraint(equalTo: sulfurDioxideContainer.centerYAnchor),
            sulfurDioxideStateImage.leadingAnchor.constraint(equalTo: sulfurDioxideContainer.leadingAnchor),
            sulfurDioxideStateImage.heightAnchor.constraint(equalToConstant: UI.stateImageSize),
            sulfurDioxideStateImage.widthAnchor.constraint(equalToConstant: UI.stateImageSize)
            ])
        sulfurDioxideStateImage.layer.cornerRadius = UI.stateImageSize / 2
        sulfurDioxideStateImage.layer.masksToBounds = true
        
        sulfurDioxideStateTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sulfurDioxideStateTitle.centerYAnchor.constraint(equalTo: sulfurDioxideContainer.centerYAnchor),
            sulfurDioxideStateTitle.leadingAnchor.constraint(equalTo: sulfurDioxideStateImage.trailingAnchor, constant: 6)
            ])
        
        sulfurDioxideStateValue.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sulfurDioxideStateValue.centerYAnchor.constraint(equalTo: sulfurDioxideContainer.centerYAnchor),
            sulfurDioxideStateValue.leadingAnchor.constraint(equalTo: sulfurDioxideStateTitle.trailingAnchor, constant: UI.basicMargin),
            sulfurDioxideStateValue.trailingAnchor.constraint(equalTo: sulfurDioxideContainer.trailingAnchor)
            ])
        
        
        //Detail Infomation StackView
        leftInnerStackView.distribution = .fillEqually
        leftInnerStackView.axis = .vertical
        
        rightInnerStackView.distribution = .fillEqually
        rightInnerStackView.axis = .vertical
        
        detailStateContainerStackView.distribution = .fillEqually
        detailStateContainerStackView.axis = .horizontal
        detailStateContainerStackView.spacing = 20
        
        detailStateContainerStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailStateContainerStackView.topAnchor.constraint(equalTo:  updateTitleLabel.bottomAnchor, constant: UI.basicMargin),
            detailStateContainerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: UI.basicMargin),
            detailStateContainerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -UI.basicMargin),
            detailStateContainerStackView.heightAnchor.constraint(equalToConstant: UI.detailInfoStackViewHeight)
        ])
        
        
    }

}
