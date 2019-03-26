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
        button.backgroundColor = .yellow
        button.layer.cornerRadius = UI.sharingButtonSize / 2
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(didTapKakao(_:)), for: UIControl.Event.touchUpInside)
        return button
    }()




    //MARK:- Properties



    //MARK:- Initialize

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

    @objc private func didTapKakao(_ sender: UIButton) {
        // Location 타입 템플릿 오브젝트 생성
        let template = KMTLocationTemplate.init { (locationTemplateBuilder) in

            // 주소
            locationTemplateBuilder.address = "경기 성남시 분당구 판교역로 235 에이치스퀘어 N동 8층"
            locationTemplateBuilder.addressTitle = "카카오 판교오피스 카페톡"

            // 컨텐츠
            locationTemplateBuilder.content = KMTContentObject.init(builderBlock: { (contentBuilder) in
                contentBuilder.title = "신메뉴 출시❤️ 체리블라썸라떼"
                contentBuilder.desc = "이번 주는 체리블라썸라떼 1+1"
                contentBuilder.imageURL = URL.init(string: "http://mud-kage.kakao.co.kr/dn/bSbH9w/btqgegaEDfW/vD9KKV0hEintg6bZT4v4WK/kakaolink40_original.png")!
                contentBuilder.link = KMTLinkObject.init(builderBlock: { (linkBuilder) in
                    linkBuilder.mobileWebURL = URL.init(string: "https://developers.kakao.com")
                })
            })

            // 소셜
            locationTemplateBuilder.social = KMTSocialObject.init(builderBlock: { (socialBuilder) in
                socialBuilder.likeCount = 286
                socialBuilder.commnentCount = 45
                socialBuilder.sharedCount = 845
            })
        }
        // 카카오링크 실행
        KLKTalkLinkCenter.shared().sendDefault(with: template, success: { (warningMsg, argumentMsg) in
            print("warning message: \(warningMsg)")
            print("argument message: \(argumentMsg)")

        }, failure: { (error) in
            print("error \(error)")

        })
    }

}

//MARK:- Action Handle

