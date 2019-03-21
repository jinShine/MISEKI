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
        static let basicMargin: CGFloat                 = 20
        static let stateImageSize: CGFloat              = 35
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
        label.font = FontName.sfMedium(15).font
        label.textColor = UIColor(white: 0, alpha: 0.5)
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
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.font = FontName.sfBold(17).font
        return label
    }()
    
    let fineDustStateValue: UILabel = {
        let label = UILabel()
        label.text = " - "
        label.textColor = UIColor.fromHexString("#0076FF")
        label.textAlignment = .center
        label.font = FontName.sfBold(16).font
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
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.font = FontName.sfBold(17).font
        return label
    }()
    
    let ultrafineDustStateValue: UILabel = {
        let label = UILabel()
        label.text = " - "
        label.textColor = UIColor.fromHexString("#0076FF")
        label.textAlignment = .center
        label.font = FontName.sfBold(16).font
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
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.font = FontName.sfBold(17).font
        return label
    }()
    
    let nitrogenDioxideStateValue: UILabel = {
        let label = UILabel()
        label.text = " - "
        label.textColor = UIColor.fromHexString("#0076FF")
        label.textAlignment = .center
        label.font = FontName.sfBold(16).font
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
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.font = FontName.sfBold(17).font
        return label
    }()
    
    let ozoneStateValue: UILabel = {
        let label = UILabel()
        label.text = " - "
        label.textColor = UIColor.fromHexString("#0076FF")
        label.textAlignment = .center
        label.font = FontName.sfBold(16).font
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
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.font = FontName.sfBold(17).font
        return label
    }()
    
    let carbonMonoxideStateValue: UILabel = {
        let label = UILabel()
        label.text = " - "
        label.textColor = UIColor.fromHexString("#0076FF")
        label.textAlignment = .center
        label.font = FontName.sfBold(16).font
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
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.font = FontName.sfBold(17).font
        return label
    }()
    
    let sulfurDioxideStateValue: UILabel = {
        let label = UILabel()
        label.text = " - "
        label.textColor = UIColor.fromHexString("#0076FF")
        label.textAlignment = .center
        label.font = FontName.sfBold(16).font
        return label
    }()
    
    lazy var firstStackView = UIStackView(arrangedSubviews:
        [ultrafineDustContainer, fineDustContainer]
    )
    lazy var secondStackView = UIStackView(arrangedSubviews:
        [carbonMonoxideContainer, nitrogenDioxideContainer]
    )
    lazy var thirdStackView = UIStackView(arrangedSubviews:
        [ozoneContainer, sulfurDioxideContainer]
    )
    
    lazy var detailStateContainerStackView = UIStackView(arrangedSubviews:
        [firstStackView, secondStackView, thirdStackView]
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
        
        [ultrafineDustStateImage, ultrafineDustStateTitle, ultrafineDustStateValue].forEach { ultrafineDustContainer.addSubview($0) }
        [fineDustStateImage, fineDustStateTitle, fineDustStateValue].forEach { fineDustContainer.addSubview($0) }
        [carbonMonoxideStateImage, carbonMonoxideStateTitle, carbonMonoxideStateValue].forEach { carbonMonoxideContainer.addSubview($0) }
        [nitrogenDioxideStateImage, nitrogenDioxideStateTitle, nitrogenDioxideStateValue].forEach { nitrogenDioxideContainer.addSubview($0) }
        [ozoneStateImage, ozoneStateTitle, ozoneStateValue].forEach { ozoneContainer.addSubview($0) }
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
        
        // 초미세먼지
        ultrafineDustStateTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ultrafineDustStateTitle.centerXAnchor.constraint(equalTo: ultrafineDustContainer.centerXAnchor),
            ultrafineDustStateTitle.leadingAnchor.constraint(equalTo: ultrafineDustContainer.leadingAnchor),
            ultrafineDustStateTitle.trailingAnchor.constraint(equalTo: ultrafineDustContainer.trailingAnchor)
            ])
        
        ultrafineDustStateImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ultrafineDustStateImage.topAnchor.constraint(equalTo: ultrafineDustStateTitle.bottomAnchor, constant: 8),
            ultrafineDustStateImage.centerXAnchor.constraint(equalTo: ultrafineDustContainer.centerXAnchor),
            ultrafineDustStateImage.heightAnchor.constraint(equalToConstant: UI.stateImageSize),
            ultrafineDustStateImage.widthAnchor.constraint(equalToConstant: UI.stateImageSize)
            ])
        
        ultrafineDustStateValue.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ultrafineDustStateValue.topAnchor.constraint(equalTo: ultrafineDustStateImage.bottomAnchor, constant: 8),
            ultrafineDustStateValue.centerXAnchor.constraint(equalTo: ultrafineDustContainer.centerXAnchor),
            ultrafineDustStateValue.leadingAnchor.constraint(equalTo: ultrafineDustContainer.leadingAnchor),
            ultrafineDustStateValue.trailingAnchor.constraint(equalTo: ultrafineDustContainer.trailingAnchor)
            ])
        
        
        fineDustStateTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fineDustStateTitle.centerXAnchor.constraint(equalTo: fineDustContainer.centerXAnchor),
            fineDustStateTitle.leadingAnchor.constraint(equalTo: fineDustContainer.leadingAnchor),
            fineDustStateTitle.trailingAnchor.constraint(equalTo: fineDustContainer.trailingAnchor)
            ])
        
        fineDustStateImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fineDustStateImage.topAnchor.constraint(equalTo: fineDustStateTitle.bottomAnchor, constant: 8),
            fineDustStateImage.centerXAnchor.constraint(equalTo: fineDustContainer.centerXAnchor),
            fineDustStateImage.heightAnchor.constraint(equalToConstant: UI.stateImageSize),
            fineDustStateImage.widthAnchor.constraint(equalToConstant: UI.stateImageSize)
            ])
        
        fineDustStateValue.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fineDustStateValue.topAnchor.constraint(equalTo: fineDustStateImage.bottomAnchor, constant: 8),
            fineDustStateValue.centerXAnchor.constraint(equalTo: fineDustContainer.centerXAnchor),
            fineDustStateValue.leadingAnchor.constraint(equalTo: fineDustContainer.leadingAnchor),
            fineDustStateValue.trailingAnchor.constraint(equalTo: fineDustContainer.trailingAnchor)
            ])
        
        
        carbonMonoxideStateTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            carbonMonoxideStateTitle.centerXAnchor.constraint(equalTo: carbonMonoxideContainer.centerXAnchor),
            carbonMonoxideStateTitle.leadingAnchor.constraint(equalTo: carbonMonoxideContainer.leadingAnchor),
            carbonMonoxideStateTitle.trailingAnchor.constraint(equalTo: carbonMonoxideContainer.trailingAnchor)
            ])
        
        carbonMonoxideStateImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            carbonMonoxideStateImage.topAnchor.constraint(equalTo: carbonMonoxideStateTitle.bottomAnchor, constant: 8),
            carbonMonoxideStateImage.centerXAnchor.constraint(equalTo: carbonMonoxideContainer.centerXAnchor),
            carbonMonoxideStateImage.heightAnchor.constraint(equalToConstant: UI.stateImageSize),
            carbonMonoxideStateImage.widthAnchor.constraint(equalToConstant: UI.stateImageSize)
            ])
        
        carbonMonoxideStateValue.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            carbonMonoxideStateValue.topAnchor.constraint(equalTo: carbonMonoxideStateImage.bottomAnchor, constant: 8),
            carbonMonoxideStateValue.centerXAnchor.constraint(equalTo: carbonMonoxideContainer.centerXAnchor),
            carbonMonoxideStateValue.leadingAnchor.constraint(equalTo: carbonMonoxideContainer.leadingAnchor),
            carbonMonoxideStateValue.trailingAnchor.constraint(equalTo: carbonMonoxideContainer.trailingAnchor)
            ])
        
        
        nitrogenDioxideStateTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nitrogenDioxideStateTitle.centerXAnchor.constraint(equalTo: nitrogenDioxideContainer.centerXAnchor),
            nitrogenDioxideStateTitle.leadingAnchor.constraint(equalTo: nitrogenDioxideContainer.leadingAnchor),
            nitrogenDioxideStateTitle.trailingAnchor.constraint(equalTo: nitrogenDioxideContainer.trailingAnchor)
            ])
        
        nitrogenDioxideStateImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nitrogenDioxideStateImage.topAnchor.constraint(equalTo: nitrogenDioxideStateTitle.bottomAnchor, constant: 8),
            nitrogenDioxideStateImage.centerXAnchor.constraint(equalTo: nitrogenDioxideContainer.centerXAnchor),
            nitrogenDioxideStateImage.heightAnchor.constraint(equalToConstant: UI.stateImageSize),
            nitrogenDioxideStateImage.widthAnchor.constraint(equalToConstant: UI.stateImageSize)
            ])
        
        nitrogenDioxideStateValue.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nitrogenDioxideStateValue.topAnchor.constraint(equalTo: nitrogenDioxideStateImage.bottomAnchor, constant: 8),
            nitrogenDioxideStateValue.centerXAnchor.constraint(equalTo: nitrogenDioxideContainer.centerXAnchor),
            nitrogenDioxideStateValue.leadingAnchor.constraint(equalTo: nitrogenDioxideContainer.leadingAnchor),
            nitrogenDioxideStateValue.trailingAnchor.constraint(equalTo: nitrogenDioxideContainer.trailingAnchor)
            ])
        
        ozoneStateTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ozoneStateTitle.centerXAnchor.constraint(equalTo: ozoneContainer.centerXAnchor),
            ozoneStateTitle.leadingAnchor.constraint(equalTo: ozoneContainer.leadingAnchor),
            ozoneStateTitle.trailingAnchor.constraint(equalTo: ozoneContainer.trailingAnchor)
            ])
        
        ozoneStateImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ozoneStateImage.topAnchor.constraint(equalTo: ozoneStateTitle.bottomAnchor, constant: 8),
            ozoneStateImage.centerXAnchor.constraint(equalTo: ozoneContainer.centerXAnchor),
            ozoneStateImage.heightAnchor.constraint(equalToConstant: UI.stateImageSize),
            ozoneStateImage.widthAnchor.constraint(equalToConstant: UI.stateImageSize)
            ])
        
        ozoneStateValue.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ozoneStateValue.topAnchor.constraint(equalTo: ozoneStateImage.bottomAnchor, constant: 8),
            ozoneStateValue.centerXAnchor.constraint(equalTo: ozoneContainer.centerXAnchor),
            ozoneStateValue.leadingAnchor.constraint(equalTo: ozoneContainer.leadingAnchor),
            ozoneStateValue.trailingAnchor.constraint(equalTo: ozoneContainer.trailingAnchor)
            ])
        
        
        sulfurDioxideStateTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sulfurDioxideStateTitle.centerXAnchor.constraint(equalTo: sulfurDioxideContainer.centerXAnchor),
            sulfurDioxideStateTitle.leadingAnchor.constraint(equalTo: sulfurDioxideContainer.leadingAnchor),
            sulfurDioxideStateTitle.trailingAnchor.constraint(equalTo: sulfurDioxideContainer.trailingAnchor)
            ])
        
        sulfurDioxideStateImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sulfurDioxideStateImage.topAnchor.constraint(equalTo: sulfurDioxideStateTitle.bottomAnchor, constant: 8),
            sulfurDioxideStateImage.centerXAnchor.constraint(equalTo: sulfurDioxideContainer.centerXAnchor),
            sulfurDioxideStateImage.heightAnchor.constraint(equalToConstant: UI.stateImageSize),
            sulfurDioxideStateImage.widthAnchor.constraint(equalToConstant: UI.stateImageSize)
            ])
        
        sulfurDioxideStateValue.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sulfurDioxideStateValue.topAnchor.constraint(equalTo: sulfurDioxideStateImage.bottomAnchor, constant: 8),
            sulfurDioxideStateValue.centerXAnchor.constraint(equalTo: sulfurDioxideContainer.centerXAnchor),
            sulfurDioxideStateValue.leadingAnchor.constraint(equalTo: sulfurDioxideContainer.leadingAnchor),
            sulfurDioxideStateValue.trailingAnchor.constraint(equalTo: sulfurDioxideContainer.trailingAnchor)
            ])
        
        
        //Detail Infomation StackView
        firstStackView.distribution = .fillEqually
        firstStackView.axis = .horizontal
        
        secondStackView.distribution = .fillEqually
        secondStackView.axis = .horizontal
        
        thirdStackView.distribution = .fillEqually
        thirdStackView.axis = .horizontal
        
        detailStateContainerStackView.distribution = .fillEqually
        detailStateContainerStackView.axis = .vertical
        detailStateContainerStackView.spacing = 20
        
        detailStateContainerStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailStateContainerStackView.topAnchor.constraint(equalTo:  updateTitleLabel.bottomAnchor, constant: UI.basicMargin),
            detailStateContainerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: UI.basicMargin),
            detailStateContainerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -UI.basicMargin),
            detailStateContainerStackView.heightAnchor.constraint(equalToConstant: 380)
        ])
        
        
    }

    func configureWith(data: FineDustModel) {
        guard let data = data.list.first else { return }
        
        // Detail Value
        fineDustStateValue.text = "\(data.pm10Value) ㎍/㎥"
        ultrafineDustStateValue.text = "\(data.pm25Value) ㎍/㎥"
        nitrogenDioxideStateValue.text = "\(data.no2Value) ppm"
        ozoneStateValue.text = "\(data.o3Value) ppm"
        carbonMonoxideStateValue.text = "\(data.coValue) ppm"
        sulfurDioxideStateValue.text = "\(data.so2Value) ppm"

        // Detail Color
        fineDustStateImage.image = data.pm10Grade.convertValueToStateImage
        ultrafineDustStateImage.image = data.pm25Grade.convertValueToStateImage
        nitrogenDioxideStateImage.image = data.no2Grade.convertValueToStateImage
        ozoneStateImage.image = data.o3Grade.convertValueToStateImage
        carbonMonoxideStateImage.image = data.coGrade.convertValueToStateImage
        sulfurDioxideStateImage.image = data.so2Grade.convertValueToStateImage
        
        updateValueLabel.text = data.dataTime
    }
    
}
