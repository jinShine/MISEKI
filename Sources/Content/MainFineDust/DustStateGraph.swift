//
//  DustStateGraph.swift
//  FineDust_Copy
//
//  Created by 승진김 on 16/03/2019.
//  Copyright © 2019 승진김. All rights reserved.
//

import UIKit

final class DustStateGraph: UITableViewCell {
    
    struct UI {
        static let basicMargin: CGFloat                 = 16
    }

    //MARK:- UI Properties
    let progressView: UIProgressView = {
        let view = UIProgressView()
        view.layer.masksToBounds = true
        view.progressTintColor = UIColor.mainColor
        view.trackTintColor = UIColor(white: 0, alpha: 0.1)
        view.layer.shadowOffset = CGSize(width: 0, height: 80)
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.cornerRadius = 10
        view.setProgress(0.0, animated: true)
        return view
    }()
    
    let progressValue: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.rgb(red: 0, green: 0, blue: 0, alpha: 0.5)
        label.font = FontName.sfBold(15).font
        return label
    }()
    
    let goodTitle: UILabel = {
        let label = UILabel()
        label.text = "좋음\n0"
        label.textAlignment = .center
        label.font = FontName.sfThin(10).font
        label.numberOfLines = 0
        return label
    }()
    
    let normalTitle: UILabel = {
        let label = UILabel()
        label.text = "보통\n16~"
        label.textAlignment = .center
        label.font = FontName.sfThin(10).font
        label.numberOfLines = 0
        return label
    }()
    
    let badTitle: UILabel = {
        let label = UILabel()
        label.text = "나쁨\n36~"
        label.textAlignment = .center
        label.font = FontName.sfThin(10).font
        label.numberOfLines = 0
        return label
    }()
    
    let veryBadTitle: UILabel = {
        let label = UILabel()
        label.text = "매우나쁨\n76~"
        label.textAlignment = .center
        label.font = FontName.sfThin(10).font
        label.numberOfLines = 0
        return label
    }()
    
    
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
        
        [goodTitle, normalTitle, badTitle, veryBadTitle, progressView].forEach {
            addSubview($0)
        }
        
        [progressValue].forEach { progressView.addSubview($0) }

        goodTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            goodTitle.bottomAnchor.constraint(equalTo: progressView.topAnchor, constant: -8),
            goodTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: UI.basicMargin)
            ])

        normalTitle.translatesAutoresizingMaskIntoConstraints = false
        if App.Device.IS_iPhoneSE {
            NSLayoutConstraint.activate([
                normalTitle.bottomAnchor.constraint(equalTo: progressView.topAnchor, constant: -8),
                normalTitle.leadingAnchor.constraint(equalTo: goodTitle.trailingAnchor, constant: 21)
                ])
        } else if App.Device.IS_iPhoneX || App.Device.IS_iPhone {
            NSLayoutConstraint.activate([
                normalTitle.bottomAnchor.constraint(equalTo: progressView.topAnchor, constant: -8),
                normalTitle.leadingAnchor.constraint(equalTo: goodTitle.trailingAnchor, constant: 25)
                ])
        } else if App.Device.IS_iPhoneXR || App.Device.IS_iPhoneXsMax || App.Device.IS_iPhonePlus {
            NSLayoutConstraint.activate([
                normalTitle.bottomAnchor.constraint(equalTo: progressView.topAnchor, constant: -8),
                normalTitle.leadingAnchor.constraint(equalTo: goodTitle.trailingAnchor, constant: 37)
                ])
        }

        badTitle.translatesAutoresizingMaskIntoConstraints = false
        if App.Device.IS_iPhoneSE {
            NSLayoutConstraint.activate([
                badTitle.bottomAnchor.constraint(equalTo: progressView.topAnchor, constant: -8),
                badTitle.leadingAnchor.constraint(equalTo: normalTitle.trailingAnchor, constant: 41)
                ])
        }
        else if App.Device.IS_iPhoneX || App.Device.IS_iPhone {
            NSLayoutConstraint.activate([
                badTitle.bottomAnchor.constraint(equalTo: progressView.topAnchor, constant: -8),
                badTitle.leadingAnchor.constraint(equalTo: normalTitle.trailingAnchor, constant: 53)
                ])
        } else if App.Device.IS_iPhoneXR || App.Device.IS_iPhoneXsMax || App.Device.IS_iPhonePlus {
            NSLayoutConstraint.activate([
                badTitle.bottomAnchor.constraint(equalTo: progressView.topAnchor, constant: -8),
                badTitle.leadingAnchor.constraint(equalTo: normalTitle.trailingAnchor, constant: 57)
                ])
        }


        veryBadTitle.translatesAutoresizingMaskIntoConstraints = false
        if App.Device.IS_iPhoneSE {
            NSLayoutConstraint.activate([
                veryBadTitle.bottomAnchor.constraint(equalTo: progressView.topAnchor, constant: -8),
                veryBadTitle.centerXAnchor.constraint(equalTo: progressView.centerXAnchor, constant: 78)
                ])
        } else if App.Device.IS_iPhoneX || App.Device.IS_iPhone {
            NSLayoutConstraint.activate([
                veryBadTitle.bottomAnchor.constraint(equalTo: progressView.topAnchor, constant: -8),
                veryBadTitle.centerXAnchor.constraint(equalTo: progressView.centerXAnchor, constant: 88)
            ])
        } else if App.Device.IS_iPhoneXR || App.Device.IS_iPhoneXsMax || App.Device.IS_iPhonePlus {
            NSLayoutConstraint.activate([
                veryBadTitle.bottomAnchor.constraint(equalTo: progressView.topAnchor, constant: -8),
                veryBadTitle.centerXAnchor.constraint(equalTo: progressView.centerXAnchor, constant: 100)
                ])
        }


        progressView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            progressView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -UI.basicMargin * 2),
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: UI.basicMargin),
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -UI.basicMargin),
            progressView.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        progressValue.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            progressValue.centerYAnchor.constraint(equalTo: progressView.centerYAnchor),
            progressValue.trailingAnchor.constraint(equalTo: progressView.trailingAnchor, constant: -UI.basicMargin)
            ])
        
        

    }
    
    func configureWith(data: FineDustModel) {
        guard let data = data.list.first else { return }
        
        let pm10Value: Float = Float(data.pm25Value) ?? 0
        UIView.animate(withDuration: 0.1, delay: 0.0, options: UIView.AnimationOptions.curveEaseInOut, animations: {}) { _ in
            self.progressView.setProgress(pm10Value / 100, animated: true)
        }
        progressValue.text = "\(data.pm25Value)㎍/㎥"
    }
    
}
