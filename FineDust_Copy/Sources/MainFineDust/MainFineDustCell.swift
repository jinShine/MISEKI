//
//  MainFineDustCell.swift
//  FineDust_Copy
//
//  Created by 승진김 on 19/02/2019.
//  Copyright © 2019 승진김. All rights reserved.
//

import UIKit

class MainFineDustCell: UITableViewCell {
    
    struct UI {
        static let basicMargin: CGFloat                 = 8
        static let naviInfoContainerHeight: CGFloat     = 46
        static let naviButtonSize: CGFloat              = 24
        static let dustStatusFontValue: CGFloat         = 60
        static let dustStateLabelHeight: CGFloat        = 450
        static let stateImageSize: CGFloat              = 10
        static let detailInfoStackViewHeight: CGFloat   = 80
    }
    
    //MARK:- UI Properties
    
    let naviInfoContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    let currentTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "2월 19일(화) 오후 6:38"
        label.textColor = .white
        return label
    }()
    
    let sharingButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.setImage(UIImage(named: "Terms"), for: UIControl.State.normal)
        return button
    }()
    
    let settingButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.setImage(UIImage(named: "Terms"), for: UIControl.State.normal)
        return button
    }()
    
    let currentLocationButton: UIButton = {
        let button = UIButton()
        button.contentHorizontalAlignment = .left
        button.setTitle("서울 서초구 서초동", for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setImage(UIImage(named: "Location"), for: UIControl.State.normal)
        button.semanticContentAttribute = .forceLeftToRight // Discuss
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: UI.basicMargin, left: UI.basicMargin, bottom: UI.basicMargin, right: UI.basicMargin)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: UI.basicMargin, bottom: 0, right: 0)
        return button
    }()
    
    let dustStateValueLabel: UILabel = {
        let label = UILabel()
        label.text = "보통"
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: UI.dustStatusFontValue, weight: UIFont.Weight.bold)
        return label
    }()
    
    
    
    //미세먼지
    let fineDustContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    let fineDustStateImage: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    let fineDustStateTitle: UILabel = {
        let label = UILabel()
        label.text = "미세먼지"
        label.textColor = .white
        return label
    }()
    
    let fineDustStateValue: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .white
        label.textAlignment = .right
        return label
    }()
    
    //초미세먼지
    let ultrafineDustContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var ultrafineDustStateImage: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    let ultrafineDustStateTitle: UILabel = {
        let label = UILabel()
        label.text = "초미세먼지"
        label.textColor = .white
        return label
    }()
    
    let ultrafineDustStateValue: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .white
        label.textAlignment = .right
        return label
    }()
    
    //이산화질소
    let nitrogenDioxideContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    let nitrogenDioxideStateImage: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    let nitrogenDioxideStateTitle: UILabel = {
        let label = UILabel()
        label.text = "이산화질소"
        label.textColor = .white
        return label
    }()
    
    let nitrogenDioxideStateValue: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .white
        label.textAlignment = .right
        return label
    }()
    
    //오존
    let ozoneContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    let ozoneStateImage: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    let ozoneStateTitle: UILabel = {
        let label = UILabel()
        label.text = "오존"
        label.textColor = .white
        return label
    }()
    
    let ozoneStateValue: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .white
        label.textAlignment = .right
        return label
    }()
    
    //일산화탄소
    let carbonMonoxideContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    let carbonMonoxideStateImage: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    let carbonMonoxideStateTitle: UILabel = {
        let label = UILabel()
        label.text = "일산화탄소"
        label.textColor = .white
        return label
    }()
    
    let carbonMonoxideStateValue: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .white
        label.textAlignment = .right
        return label
    }()
    
    //이황산가스
    let sulfurDioxideContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    let sulfurDioxideStateImage: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    let sulfurDioxideStateTitle: UILabel = {
        let label = UILabel()
        label.text = "이황산가스"
        label.textColor = .white
        return label
    }()
    
    let sulfurDioxideStateValue: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .white
        label.textAlignment = .right
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
    
    
    // 미세먼지 예보
    let forecastContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let forecastTitle: UILabel = {
        let label = UILabel()
        label.text = "미세먼지 예보"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    let tomorrowTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "내일"
        label.textColor = .gray
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let tomorrowValueLabel: UILabel = {
        let label = UILabel()
        label.text = "나쁨"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        return label
    }()
    
    let verticalSeparatorLine: UIView = {
        let label = UILabel()
        label.backgroundColor = .gray
        return label
    }()
    
    let afterTomorrowTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "모레"
        label.textColor = .gray
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let afterTomorrowValueLabel: UILabel = {
        let label = UILabel()
        label.text = "나쁨"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        return label
    }()


    
    

    //MARK:- Initialize
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        setupUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //MARK:- Setup
    private func setupUI() {
        
        // Discuss
        [naviInfoContainerView, currentLocationButton, dustStateValueLabel,
         detailStateContainerStackView, forecastContainer].forEach {
            addSubview($0)
        }
        
        [currentTimeLabel, sharingButton, settingButton].forEach { naviInfoContainerView.addSubview($0) }
        [fineDustStateImage, fineDustStateTitle, fineDustStateValue].forEach { fineDustContainer.addSubview($0) }
        [ultrafineDustStateImage, ultrafineDustStateTitle, ultrafineDustStateValue].forEach { ultrafineDustContainer.addSubview($0) }
        [nitrogenDioxideStateImage, nitrogenDioxideStateTitle, nitrogenDioxideStateValue].forEach { nitrogenDioxideContainer.addSubview($0) }
        [ozoneStateImage, ozoneStateTitle, ozoneStateValue].forEach { ozoneContainer.addSubview($0) }
        [carbonMonoxideStateImage, carbonMonoxideStateTitle, carbonMonoxideStateValue].forEach { carbonMonoxideContainer.addSubview($0) }
        [sulfurDioxideStateImage, sulfurDioxideStateTitle, sulfurDioxideStateValue].forEach { sulfurDioxideContainer.addSubview($0) }

        [forecastTitle, tomorrowTitleLabel, tomorrowValueLabel,
         verticalSeparatorLine, afterTomorrowTitleLabel, afterTomorrowValueLabel].forEach {
            forecastContainer.addSubview($0)
        }
        
        
        naviInfoContainerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            naviInfoContainerView.topAnchor.constraint(equalTo: topAnchor),
            naviInfoContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            naviInfoContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            naviInfoContainerView.heightAnchor.constraint(equalToConstant: UI.naviInfoContainerHeight)
            ])
        
        currentTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            currentTimeLabel.centerYAnchor.constraint(equalTo: naviInfoContainerView.centerYAnchor),
            currentTimeLabel.leadingAnchor.constraint(equalTo: naviInfoContainerView.leadingAnchor, constant: UI.basicMargin * 2),
            currentTimeLabel.trailingAnchor.constraint(equalTo: sharingButton.leadingAnchor, constant: -(UI.basicMargin * 2))
            ])
        
        sharingButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sharingButton.centerYAnchor.constraint(equalTo: naviInfoContainerView.centerYAnchor),
            sharingButton.trailingAnchor.constraint(equalTo: settingButton.leadingAnchor, constant: -(UI.basicMargin * 2)),
            sharingButton.heightAnchor.constraint(equalToConstant: UI.naviButtonSize),
            sharingButton.widthAnchor.constraint(equalToConstant: UI.naviButtonSize)
            ])
        
        settingButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            settingButton.centerYAnchor.constraint(equalTo: naviInfoContainerView.centerYAnchor),
            settingButton.trailingAnchor.constraint(equalTo: naviInfoContainerView.trailingAnchor, constant: -(UI.basicMargin * 2)),
            settingButton.heightAnchor.constraint(equalToConstant: UI.naviButtonSize),
            settingButton.widthAnchor.constraint(equalToConstant: UI.naviButtonSize)
            ])
        
        currentLocationButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            currentLocationButton.topAnchor.constraint(equalTo: naviInfoContainerView.bottomAnchor, constant: UI.basicMargin),
            currentLocationButton.leadingAnchor.constraint(equalTo: naviInfoContainerView.leadingAnchor),
            currentLocationButton.trailingAnchor.constraint(equalTo: naviInfoContainerView.trailingAnchor)
            ])
        
        dustStateValueLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dustStateValueLabel.topAnchor.constraint(equalTo: currentLocationButton.bottomAnchor, constant: UI.basicMargin * 2),
            dustStateValueLabel.leadingAnchor.constraint(equalTo: naviInfoContainerView.leadingAnchor),
            dustStateValueLabel.trailingAnchor.constraint(equalTo: naviInfoContainerView.trailingAnchor),
            dustStateValueLabel.heightAnchor.constraint(equalToConstant: UI.dustStateLabelHeight)
            ])
        
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
            fineDustStateTitle.leadingAnchor.constraint(equalTo: fineDustStateImage.trailingAnchor, constant: 4)
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
            ultrafineDustStateTitle.leadingAnchor.constraint(equalTo: ultrafineDustStateImage.trailingAnchor, constant: 4)
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
            nitrogenDioxideStateTitle.leadingAnchor.constraint(equalTo: nitrogenDioxideStateImage.trailingAnchor, constant: 4)
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
            ozoneStateTitle.leadingAnchor.constraint(equalTo: ozoneStateImage.trailingAnchor, constant: 4)
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
            carbonMonoxideStateTitle.leadingAnchor.constraint(equalTo: carbonMonoxideStateImage.trailingAnchor, constant: 4)
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
            sulfurDioxideStateTitle.leadingAnchor.constraint(equalTo: sulfurDioxideStateImage.trailingAnchor, constant: 4)
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
            detailStateContainerStackView.topAnchor.constraint(equalTo:  dustStateValueLabel.bottomAnchor, constant: UI.basicMargin),
            detailStateContainerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: UI.basicMargin * 2),
            detailStateContainerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -(UI.basicMargin * 2)),
            detailStateContainerStackView.heightAnchor.constraint(equalToConstant: UI.detailInfoStackViewHeight)
        ])
        

        //미세먼지 예보
        forecastContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            forecastContainer.topAnchor.constraint(equalTo: detailStateContainerStackView.bottomAnchor, constant: (UI.basicMargin * 3)),
            forecastContainer.leadingAnchor.constraint(equalTo: detailStateContainerStackView.leadingAnchor),
            forecastContainer.trailingAnchor.constraint(equalTo: detailStateContainerStackView.trailingAnchor),
            forecastContainer.heightAnchor.constraint(equalToConstant: 150)
            ])
        forecastContainer.layer.cornerRadius = 10
        forecastContainer.layer.masksToBounds = true
        
        forecastTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            forecastTitle.topAnchor.constraint(equalTo: forecastContainer.topAnchor, constant: (UI.basicMargin * 2)),
            forecastTitle.leadingAnchor.constraint(equalTo: forecastContainer.leadingAnchor),
            forecastTitle.trailingAnchor.constraint(equalTo: forecastContainer.trailingAnchor),
            ])

        verticalSeparatorLine.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            verticalSeparatorLine.topAnchor.constraint(equalTo: forecastTitle.bottomAnchor, constant: UI.basicMargin * 2),
            verticalSeparatorLine.centerXAnchor.constraint(equalTo: forecastContainer.centerXAnchor),
            verticalSeparatorLine.widthAnchor.constraint(equalToConstant: 1),
            verticalSeparatorLine.bottomAnchor.constraint(equalTo: forecastContainer.bottomAnchor, constant: -(UI.basicMargin * 2))
            ])

        tomorrowTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tomorrowTitleLabel.topAnchor.constraint(equalTo: verticalSeparatorLine.topAnchor),
            tomorrowTitleLabel.trailingAnchor.constraint(equalTo: verticalSeparatorLine.leadingAnchor, constant: -70),
            ])

        tomorrowValueLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tomorrowValueLabel.topAnchor.constraint(equalTo: tomorrowTitleLabel.bottomAnchor, constant: UI.basicMargin / 2),
            tomorrowValueLabel.centerXAnchor.constraint(equalTo: tomorrowTitleLabel.centerXAnchor)
            ])

        afterTomorrowTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            afterTomorrowTitleLabel.topAnchor.constraint(equalTo: verticalSeparatorLine.topAnchor),
            afterTomorrowTitleLabel.leadingAnchor.constraint(equalTo: verticalSeparatorLine.trailingAnchor, constant: 70),
            ])

        afterTomorrowValueLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            afterTomorrowValueLabel.topAnchor.constraint(equalTo: tomorrowTitleLabel.bottomAnchor, constant: UI.basicMargin / 2),
            afterTomorrowValueLabel.centerXAnchor.constraint(equalTo: afterTomorrowTitleLabel.centerXAnchor)
            ])

        
        
    }
    
}
