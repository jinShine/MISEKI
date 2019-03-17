//
//  MainFineDustCell.swift
//  FineDust_Copy
//
//  Created by 승진김 on 19/02/2019.
//  Copyright © 2019 승진김. All rights reserved.
//

import UIKit
import fluid_slider

class DustCell: UITableViewCell {
    
    struct UI {
        static let basicMargin: CGFloat                 = 8
        static let mainDustInnerMargin: CGFloat         = 48
        static let mainStateImageSize: CGFloat          = 30
        static let dustStatusFontValue: CGFloat         = 60
        static let dustStateLabelHeight: CGFloat        = 450
        static let stateImageSize: CGFloat              = 14
        static let detailInfoStackViewHeight: CGFloat   = 80
        static let detailFont: UIFont = UIFont.systemFont(ofSize: 15)
    }
    
    //MARK:- UI Properties
    
    
    // Main Cell ImageView
    let mainDustImageViewContainer: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Rectangle")
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    // < in Main Cell ImageView
    let currentLocationLabel: UILabel = {
        let label = UILabel()
        label.font = FontName.sfHeavy(17).font
        label.text = " - "
        label.textColor = UIColor.rgb(red: 0, green: 0, blue: 0, alpha: 0.5)
        return label
    }()
    
    let dustStateValueLabel: UILabel = {
        let label = UILabel()
        label.text = " - "
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.font = FontName.sfBold(50).font
        return label
    }()
    
    let dustStateImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let dustStateAngelCommnet: UILabel = {
        let label = UILabel()
        label.text = "😇 어린이, 노인, 노약자\n장시간 실외활동 가급적 자제하세요"
        label.textAlignment = .left
        label.font = FontName.sfBold(20).font
        label.numberOfLines = 0
        return label
    }()
    
    let dustStateDevilCommnet: UILabel = {
        let label = UILabel()
        label.text = "뭐 어때~ 놀자! 👿"
        label.textAlignment = .right
        label.font = FontName.sfBold(20).font
        label.numberOfLines = 0
        return label
    }()
    // -- in Main Cell ImageView >
    
    
    
    // Main Dust Detail

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

    let updateTimeLabel: UILabel = {
        let label = UILabel()
        let attributeString = NSMutableAttributedString(string: "업데이트")
        return label
    }()
    
    
    //MARK:- Properties
    

    //MARK:- Initialize
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .white
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //MARK:- Setup
    private func setupUI() {
        
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
        
        // Discuss
        [mainDustImageViewContainer,
         detailStateContainerStackView, forecastContainer].forEach {
            addSubview($0)
        }
        
        
        [currentLocationLabel, dustStateValueLabel, dustStateImage,
         dustStateAngelCommnet, dustStateDevilCommnet
         ].forEach { mainDustImageViewContainer.addSubview($0) }
        
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

        /////Main Container
        mainDustImageViewContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainDustImageViewContainer.topAnchor.constraint(equalTo: topAnchor, constant: UI.basicMargin),
            mainDustImageViewContainer.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainDustImageViewContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: UI.basicMargin * 2),
            mainDustImageViewContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -(UI.basicMargin * 2)),
            mainDustImageViewContainer.heightAnchor.constraint(equalToConstant: 350)
            ])
        
        currentLocationLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            currentLocationLabel.topAnchor.constraint(equalTo: mainDustImageViewContainer.topAnchor, constant: UI.mainDustInnerMargin),
            currentLocationLabel.leadingAnchor.constraint(equalTo: mainDustImageViewContainer.leadingAnchor, constant: UI.mainDustInnerMargin),
            currentLocationLabel.trailingAnchor.constraint(equalTo: mainDustImageViewContainer.trailingAnchor, constant: -(UI.mainDustInnerMargin))
            ])
        
        dustStateValueLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dustStateValueLabel.topAnchor.constraint(equalTo: currentLocationLabel.bottomAnchor, constant: UI.basicMargin * 2),
            dustStateValueLabel.leadingAnchor.constraint(equalTo: mainDustImageViewContainer.leadingAnchor, constant: UI.mainDustInnerMargin)
            ])
        
        dustStateImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dustStateImage.bottomAnchor.constraint(equalTo: dustStateValueLabel.bottomAnchor),
            dustStateImage.leadingAnchor.constraint(equalTo: dustStateValueLabel.trailingAnchor, constant: UI.basicMargin),
            dustStateImage.trailingAnchor.constraint(greaterThanOrEqualTo: mainDustImageViewContainer.trailingAnchor, constant: -UI.mainDustInnerMargin),
            dustStateImage.widthAnchor.constraint(equalToConstant: UI.mainStateImageSize),
            dustStateImage.heightAnchor.constraint(equalToConstant: UI.mainStateImageSize)
            ])
        
        dustStateAngelCommnet.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dustStateAngelCommnet.topAnchor.constraint(equalTo: dustStateValueLabel.bottomAnchor, constant: UI.basicMargin * 2),
            dustStateAngelCommnet.leadingAnchor.constraint(equalTo: dustStateValueLabel.leadingAnchor),
            dustStateAngelCommnet.trailingAnchor.constraint(equalTo: mainDustImageViewContainer.trailingAnchor, constant: -UI.mainDustInnerMargin)
            ])
        
        dustStateDevilCommnet.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dustStateDevilCommnet.topAnchor.constraint(equalTo: dustStateAngelCommnet.bottomAnchor, constant: UI.basicMargin),
            dustStateDevilCommnet.leadingAnchor.constraint(equalTo: dustStateAngelCommnet.leadingAnchor),
            dustStateDevilCommnet.trailingAnchor.constraint(equalTo: dustStateAngelCommnet.trailingAnchor),
            dustStateDevilCommnet.bottomAnchor.constraint(equalTo: mainDustImageViewContainer.bottomAnchor, constant: -UI.mainDustInnerMargin)
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
            detailStateContainerStackView.topAnchor.constraint(equalTo:  mainDustImageViewContainer.bottomAnchor, constant: UI.basicMargin),
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

        slider.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            slider.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            slider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            slider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
            
            ])
        
    }
    
    func configureWith(data: FineDustModel, placeMark: PlaceMark) {
        guard let data = data.list.first else { return }
        
        guard let administrativeArea = placeMark.administrativeArea,
            let locality = placeMark.locality,
            let subLocality = placeMark.subLocality else { return }
        
        
        // Current Location
        let currentLocation = "\(administrativeArea) \(locality) \(subLocality)"
        currentLocationLabel.text = currentLocation
        
        // Main State
        dustStateValueLabel.text = data.pm10Grade.convertValueToStatus
        
        // Main State Image
        dustStateImage.image = data.pm10Grade.convertValueToStateImage
        
        // Main Angel Commnet
//        let dd = data.pm10Grade.convertGradeToAngelComment
//        print("DDDDDDDDDDDDDDDD", dd)
//        dustStateAngelCommnet.attributedText = data.pm10Grade.convertGradeToAngelComment
        

//        dustStateAngelCommnet.text =

        // Detail Value
        fineDustStateValue.text = data.pm10Value
        ultrafineDustStateValue.text = data.pm25Value
        nitrogenDioxideStateValue.text = data.no2Value
        ozoneStateValue.text = data.o3Value
        carbonMonoxideStateValue.text = data.coValue
        sulfurDioxideStateValue.text = data.so2Value

        // Detail Color
        fineDustStateImage.image = data.pm10Grade.convertValueToStateImage
        ultrafineDustStateImage.image = data.pm25Grade.convertValueToStateImage
        nitrogenDioxideStateImage.image = data.no2Grade.convertValueToStateImage
        ozoneStateImage.image = data.o3Grade.convertValueToStateImage
        carbonMonoxideStateImage.image = data.coGrade.convertValueToStateImage
        sulfurDioxideStateImage.image = data.so2Grade.convertValueToStateImage
        
        
        
    }
}
