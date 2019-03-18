//
//  MainFineDustCell.swift
//  FineDust_Copy
//
//  Created by 승진김 on 19/02/2019.
//  Copyright © 2019 승진김. All rights reserved.
//

import UIKit

class DustCell: UITableViewCell {
    
    //MARK:- Constant
    
    struct UI {
        static let basicMargin: CGFloat                 = 8
        static let mainDustInnerMargin: CGFloat         = 48
        static let mainStateImageSize: CGFloat          = 30
        static let mainDustCellHeight: CGFloat          = 350
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
    
    
    
    
    
    
//    // 미세먼지 예보
//    let forecastContainer: UIView = {
//        let view = UIView()
//        view.backgroundColor = .white
//        return view
//    }()
//
//    let forecastTitle: UILabel = {
//        let label = UILabel()
//        label.text = "미세먼지 예보"
//        label.textColor = .black
//        label.textAlignment = .center
//        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
//        return label
//    }()
//
//    let tomorrowTitleLabel: UILabel = {
//        let label = UILabel()
//        label.text = "내일"
//        label.textColor = .gray
//        label.textAlignment = .center
//        label.font = UIFont.systemFont(ofSize: 14)
//        return label
//    }()
//
//    let tomorrowValueLabel: UILabel = {
//        let label = UILabel()
//        label.text = "나쁨"
//        label.textColor = .black
//        label.textAlignment = .center
//        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
//        return label
//    }()
//
//    let verticalSeparatorLine: UIView = {
//        let label = UILabel()
//        label.backgroundColor = .gray
//        return label
//    }()
//
//    let afterTomorrowTitleLabel: UILabel = {
//        let label = UILabel()
//        label.text = "모레"
//        label.textColor = .gray
//        label.textAlignment = .center
//        label.font = UIFont.systemFont(ofSize: 14)
//        return label
//    }()
//
//    let afterTomorrowValueLabel: UILabel = {
//        let label = UILabel()
//        label.text = "나쁨"
//        label.textColor = .black
//        label.textAlignment = .center
//        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
//        return label
//    }()
//
//    let updateTimeLabel: UILabel = {
//        let label = UILabel()
//        let attributeString = NSMutableAttributedString(string: "업데이트")
//        return label
//    }()
    
    
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
        
        [mainDustImageViewContainer].forEach {
            addSubview($0)
        }
        
        
        [currentLocationLabel, dustStateValueLabel, dustStateImage,
         dustStateAngelCommnet, dustStateDevilCommnet
         ].forEach { mainDustImageViewContainer.addSubview($0) }
 
//        [forecastTitle, tomorrowTitleLabel, tomorrowValueLabel,
//         verticalSeparatorLine, afterTomorrowTitleLabel, afterTomorrowValueLabel].forEach {
//            forecastContainer.addSubview($0)
//        }

        /////Main Container
        mainDustImageViewContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainDustImageViewContainer.topAnchor.constraint(equalTo: topAnchor, constant: UI.basicMargin),
            mainDustImageViewContainer.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainDustImageViewContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: UI.basicMargin * 2),
            mainDustImageViewContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -(UI.basicMargin * 2)),
            mainDustImageViewContainer.heightAnchor.constraint(equalToConstant: UI.mainDustCellHeight)
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
        
        
        
        
        
        

        //미세먼지 예보
//        forecastContainer.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            forecastContainer.topAnchor.constraint(equalTo: detailStateContainerStackView.bottomAnchor, constant: (UI.basicMargin * 3)),
//            forecastContainer.leadingAnchor.constraint(equalTo: detailStateContainerStackView.leadingAnchor),
//            forecastContainer.trailingAnchor.constraint(equalTo: detailStateContainerStackView.trailingAnchor),
//            forecastContainer.heightAnchor.constraint(equalToConstant: 150)
//            ])
//        forecastContainer.layer.cornerRadius = 10
//        forecastContainer.layer.masksToBounds = true
//
//        forecastTitle.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            forecastTitle.topAnchor.constraint(equalTo: forecastContainer.topAnchor, constant: (UI.basicMargin * 2)),
//            forecastTitle.leadingAnchor.constraint(equalTo: forecastContainer.leadingAnchor),
//            forecastTitle.trailingAnchor.constraint(equalTo: forecastContainer.trailingAnchor),
//            ])
//
//        verticalSeparatorLine.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            verticalSeparatorLine.topAnchor.constraint(equalTo: forecastTitle.bottomAnchor, constant: UI.basicMargin * 2),
//            verticalSeparatorLine.centerXAnchor.constraint(equalTo: forecastContainer.centerXAnchor),
//            verticalSeparatorLine.widthAnchor.constraint(equalToConstant: 1),
//            verticalSeparatorLine.bottomAnchor.constraint(equalTo: forecastContainer.bottomAnchor, constant: -(UI.basicMargin * 2))
//            ])
//
//        tomorrowTitleLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            tomorrowTitleLabel.topAnchor.constraint(equalTo: verticalSeparatorLine.topAnchor),
//            tomorrowTitleLabel.trailingAnchor.constraint(equalTo: verticalSeparatorLine.leadingAnchor, constant: -70),
//            ])
//
//        tomorrowValueLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            tomorrowValueLabel.topAnchor.constraint(equalTo: tomorrowTitleLabel.bottomAnchor, constant: UI.basicMargin / 2),
//            tomorrowValueLabel.centerXAnchor.constraint(equalTo: tomorrowTitleLabel.centerXAnchor)
//            ])
//
//        afterTomorrowTitleLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            afterTomorrowTitleLabel.topAnchor.constraint(equalTo: verticalSeparatorLine.topAnchor),
//            afterTomorrowTitleLabel.leadingAnchor.constraint(equalTo: verticalSeparatorLine.trailingAnchor, constant: 70),
//            ])
//
//        afterTomorrowValueLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            afterTomorrowValueLabel.topAnchor.constraint(equalTo: tomorrowTitleLabel.bottomAnchor, constant: UI.basicMargin / 2),
//            afterTomorrowValueLabel.centerXAnchor.constraint(equalTo: afterTomorrowTitleLabel.centerXAnchor)
//            ])


        
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

//        // Detail Value
//        fineDustStateValue.text = data.pm10Value
//        ultrafineDustStateValue.text = data.pm25Value
//        nitrogenDioxideStateValue.text = data.no2Value
//        ozoneStateValue.text = data.o3Value
//        carbonMonoxideStateValue.text = data.coValue
//        sulfurDioxideStateValue.text = data.so2Value
//
//        // Detail Color
//        fineDustStateImage.image = data.pm10Grade.convertValueToStateImage
//        ultrafineDustStateImage.image = data.pm25Grade.convertValueToStateImage
//        nitrogenDioxideStateImage.image = data.no2Grade.convertValueToStateImage
//        ozoneStateImage.image = data.o3Grade.convertValueToStateImage
//        carbonMonoxideStateImage.image = data.coGrade.convertValueToStateImage
//        sulfurDioxideStateImage.image = data.so2Grade.convertValueToStateImage
//
//
        
    }
}
