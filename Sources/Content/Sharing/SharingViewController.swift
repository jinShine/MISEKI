//
//  SharingViewController.swift
//  FineDust_Copy
//
//  Created by 승진김 on 25/03/2019.
//  Copyright © 2019 승진김. All rights reserved.
//

import UIKit
import KakaoLink
import KakaoMessageTemplate



final class SharingViewController: UIViewController {
    
    //MARK:- UI Constant

    private struct UI {
        static let sharingContainerViewHeight: CGFloat = 130
        static let basicMargin: CGFloat = 20
        static let sharingButtonSize: CGFloat = 60
    }


    //MARK:- UI Property

    let sharingContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()

    let kakaoSharing: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Kakao_Logo"), for: .normal)
        button.backgroundColor = UIColor.fromHexString("#ffe812")
        button.layer.cornerRadius = UI.sharingButtonSize / 2
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(didTapKakao(_:)), for: .touchUpInside)
        return button
    }()




    //MARK:- Properties

    private var fineDustModel: FineDustModel?
    private var placeMark: PlaceMark?


    //MARK:- Initialize
    
    init(fineDustModel: FineDustModel, placeMark: PlaceMark) {
        super.init(nibName: nil, bundle: nil)
        self.fineDustModel = fineDustModel
        self.placeMark = placeMark
        
        print("FineDust!!!!!!!!!!!!!!", self.fineDustModel)
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }



    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        setupUI()


    }

    override var prefersStatusBarHidden: Bool {
        return true
    }





    //MARK:- Setup

    private func setupUI() {

        [sharingContainerView].forEach {
            view.addSubview($0)
        }

        [kakaoSharing].forEach {
            sharingContainerView.addSubview($0)
        }

        // view Tap Dissmiss
        let viewGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapBackgroundDismiss))
        view.addGestureRecognizer(viewGestureRecognizer)

        sharingContainerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sharingContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            sharingContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            sharingContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            sharingContainerView.heightAnchor.constraint(equalToConstant: UI.sharingContainerViewHeight)
        ])

        kakaoSharing.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            kakaoSharing.leadingAnchor.constraint(equalTo: sharingContainerView.leadingAnchor, constant: UI.basicMargin),
            kakaoSharing.centerYAnchor.constraint(equalTo: sharingContainerView.centerYAnchor),
            kakaoSharing.heightAnchor.constraint(equalToConstant: UI.sharingButtonSize),
            kakaoSharing.widthAnchor.constraint(equalToConstant: UI.sharingButtonSize)
        ])

    }

    
}

//MARK:- Action Handle

extension SharingViewController {
    
    @objc private func didTapKakao(_ sender: UIButton) {
        let template = KMTFeedTemplate { feedTemplateBuilder in
            feedTemplateBuilder.content = KMTContentObject(builderBlock: { contentBuilder in
                contentBuilder.title = "미새끼"
                contentBuilder.desc = "현재 \(self.placeMark?.administrativeArea ?? "") \(self.placeMark?.locality ?? "") \(self.placeMark?.subLocality ?? "") 미세먼지는 \(self.fineDustModel?.list.first?.pm25Value ?? "")㎍/㎥ '\(self.fineDustModel?.list.first?.pm25Grade.convertValueToStatus ?? "")' 입니다"
                
                contentBuilder.imageURL = URL(string: "https://i.imgur.com/lXFCOl1.png")!
                contentBuilder.link = KMTLinkObject(builderBlock: { (linkBuilder) in
                    linkBuilder.mobileWebURL = URL(string: "https://i.imgur.com/YTS3klJ.png")!
                })
            })
            
            feedTemplateBuilder.addButton(KMTButtonObject(builderBlock: { (buttonBuilder) in
                buttonBuilder.title = "미새끼에서 보기"
                buttonBuilder.link = KMTLinkObject(builderBlock: { (linkBuilder) in
                    linkBuilder.iosExecutionParams = nil
                    linkBuilder.androidExecutionParams = nil
                })
            }))
        }
        
        // 카카오링크 실행
        KLKTalkLinkCenter.shared().sendDefault(with: template, success: { (warningMsg, argumentMsg) in
            
            // 성공
            print("warning message: \(String(describing: warningMsg))")
            print("argument message: \(String(describing: argumentMsg))")
            
        }, failure: { (error) in
            // 실패
            print("error \(error)")
            
        })
        
    }

    @objc private func didTapBackgroundDismiss() {
        dismiss(animated: false, completion: nil)
    }
}
