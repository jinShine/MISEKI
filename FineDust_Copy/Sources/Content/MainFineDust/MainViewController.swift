//
//  MainViewController.swift
//  FineDust_Copy
//
//  Created by 승진김 on 19/02/2019.
//  Copyright © 2019 승진김. All rights reserved.
//

import UIKit
import CoreLocation

final class MainViewController: UIViewController {
    
    //MARK:- UI Constant
    
    private struct UI {
        static let basicMargin: CGFloat                 = 8
        static let navigationHeight: CGFloat            = 46
        static let buttonSizeInNavigation: CGFloat      = 24
        static let tableViewHeight: CGFloat             = 830
    }
    
    //MARK:- UI Property
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = .clear
        tableView.backgroundColor = .clear
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        tableView.tableFooterView = UIView()
        tableView.register(DustCell.self, forCellReuseIdentifier: String(describing: DustCell.self))
        tableView.register(DustStateGraph.self, forCellReuseIdentifier: String(describing: DustStateGraph.self))
        tableView.register(DustDetail.self, forCellReuseIdentifier: String(describing: DustDetail.self))
        return tableView
    }()
    
    
    // Custom Navigation
    let navigationContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    // Buttons in Custom Navigation
    let findLocationButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.setImage(UIImage(named: "Location-1"), for: UIControl.State.normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(didTapLocation(_:)), for: UIControl.Event.touchUpInside)
        return button
    }()
    
    let sharingButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.setImage(UIImage(named: "Share-1"), for: UIControl.State.normal)
        return button
    }()
    
    let settingButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.setImage(UIImage(named: "Settings-1"), for: UIControl.State.normal)
        return button
    }()
    
    
    
    //MARK:- Properties
    
    private var fineDustService: FineDustServiceType?
    private var placeMark: PlaceMark?
    private var locationManager: LocationManager?
    
    private var mainFineDusts = FineDustModel()
    
    
    //MARK:- Initialize
    
    init(fineDustService: FineDustService, placeMark: PlaceMark) {
        super.init(nibName: nil, bundle: nil)
        self.fineDustService = fineDustService
        self.placeMark = placeMark
        self.locationManager = LocationManager.shared
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
        
        setupUI()
//        setupBackgroundAnimation()
        setupNotification()

        locationManager?.delegate = self
        guard CLLocationManager.locationServicesEnabled() else { return }

        
        updateRegion(notification: nil)
        
    }

    
    //MARK:- Setup
    
    private func setupUI() {
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        view.backgroundColor = .white
        
        [navigationContainerView, tableView].forEach { view.addSubview($0) }
        [findLocationButton, sharingButton, settingButton].forEach { navigationContainerView.addSubview($0) }
        
        // Custom Navigation
        navigationContainerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            navigationContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navigationContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigationContainerView.heightAnchor.constraint(equalToConstant: UI.navigationHeight)
            ])
        
        // Buttons In Custom Navigation
        findLocationButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            findLocationButton.centerYAnchor.constraint(equalTo: navigationContainerView.centerYAnchor),
            findLocationButton.trailingAnchor.constraint(equalTo: sharingButton.leadingAnchor, constant: -(UI.basicMargin * 2)),
            findLocationButton.heightAnchor.constraint(equalToConstant: UI.buttonSizeInNavigation),
            findLocationButton.widthAnchor.constraint(equalToConstant: UI.buttonSizeInNavigation)
            ])
        
        sharingButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sharingButton.centerYAnchor.constraint(equalTo: navigationContainerView.centerYAnchor),
            sharingButton.trailingAnchor.constraint(equalTo: settingButton.leadingAnchor, constant: -(UI.basicMargin * 2)),
            sharingButton.heightAnchor.constraint(equalToConstant: UI.buttonSizeInNavigation),
            sharingButton.widthAnchor.constraint(equalToConstant: 20)
            ])
        
        settingButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            settingButton.centerYAnchor.constraint(equalTo: navigationContainerView.centerYAnchor),
            settingButton.trailingAnchor.constraint(equalTo: navigationContainerView.trailingAnchor, constant: -(UI.basicMargin * 2)),
            settingButton.heightAnchor.constraint(equalToConstant: UI.buttonSizeInNavigation),
            settingButton.widthAnchor.constraint(equalToConstant: UI.buttonSizeInNavigation)
            ])
        
        // TableView
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: navigationContainerView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        
        
    }
    
    private func setupBackgroundAnimation() {
        let flakeEmitterCell = CAEmitterCell()
        flakeEmitterCell.contents = UIImage(named: "Terms")?.cgImage
        flakeEmitterCell.scale = 0.06
        flakeEmitterCell.scaleRange = 0.3
        flakeEmitterCell.emissionRange = .pi
        flakeEmitterCell.lifetime = 20.0
        flakeEmitterCell.birthRate = 40
        flakeEmitterCell.velocity = -30
        flakeEmitterCell.velocityRange = -20
        flakeEmitterCell.yAcceleration = 30
        flakeEmitterCell.xAcceleration = 5
        flakeEmitterCell.spin = -0.5
        flakeEmitterCell.spinRange = 1.0
        
        let snowEmitterLayer = CAEmitterLayer()
        snowEmitterLayer.emitterPosition = CGPoint(x: view.bounds.width / 2.0, y: -50)
        snowEmitterLayer.emitterSize = CGSize(width: view.bounds.width, height: 0)
        snowEmitterLayer.emitterShape = CAEmitterLayerEmitterShape.line
        snowEmitterLayer.beginTime = CACurrentMediaTime()
        snowEmitterLayer.timeOffset = 10
        snowEmitterLayer.emitterCells = [flakeEmitterCell]
        view.layer.addSublayer(snowEmitterLayer)
    }
    
    private func setupNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateRegion(notification:)), name: NSNotification.Name.init(App.Constant.updateRegion.rawValue), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}

extension MainViewController {
    enum Row: Int {
        case DustCell
        case DustStateGraph
        case DustDetail
        case totalCount
    }
}

//MARK:- Action Handle
extension MainViewController {
    
    private func requestFineDust(city: String) {
        fineDustService?.requestFineDustInfo(sido: city) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let fineDustInfo):
                print("", fineDustInfo)
                self.mainFineDusts = fineDustInfo
                self.tableView.reloadData()
            case .failure(let error):
                print("erorr", error)
            }
        }
    }
    
    private func locationAuthCheckAlert() {
        let alertController = UIAlertController(title: "위치서비스 허용 안내", message: "원활한 서비스를 위해\n위치서비스를 활성화 시켜주세요", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "위치서비스 설정", style: UIAlertAction.Style.default) { _ in
            guard let url = URL(string: UIApplication.openSettingsURLString) else { return }
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        let cancelAction = UIAlertAction(title: "취소", style: UIAlertAction.Style.cancel, handler: nil)
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @objc private func updateRegion(notification: Notification?) {
        locationManager?.reverseGeocoderLocation { [weak self] placeMark in
            DispatchQueue.main.async {
                if let region = notification?.userInfo?[App.Constant.updateRegion.rawValue] as? Juso {
                    self?.placeMark = PlaceMark(administrativeArea: region.siNm, locality: region.sggNm, subLocality: region.emdNm)
                    self?.requestFineDust(city: region.siNm.convertCityShortening)
                } else {
                    guard let city = placeMark.administrativeArea else { return }
                    self?.placeMark = PlaceMark(placeMark: placeMark)
                    self?.requestFineDust(city: city.convertCityShortening)
                }
            }
        }
    }
    
    @objc private func didTapLocation(_ sender: UIButton) {
        present(SearchAddressViewController(addressService: AddressService()), animated: true, completion: nil)
    }
    
    
}


//MARK:- UITableView Datasource
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Row.totalCount.rawValue
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case Row.DustCell.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DustCell.self), for: indexPath) as? DustCell else { return UITableViewCell() }
            
            cell.configureWith(data: mainFineDusts, placeMark: placeMark ?? PlaceMark())
            
            return cell
        case Row.DustStateGraph.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DustStateGraph.self), for: indexPath) as? DustStateGraph else { return UITableViewCell() }
            
            cell.configureWith(data: mainFineDusts)
            
            return cell
        case Row.DustDetail.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DustDetail.self), for: indexPath) as? DustDetail else { return UITableViewCell() }
            
            cell.configureWith(data: mainFineDusts)
            
            return cell
            
        default:
            return UITableViewCell()
        }
        
    }
}


//MARK:- UITableView Delegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        switch indexPath.row {
        case Row.DustCell.rawValue:
            return 365
        case Row.DustStateGraph.rawValue:
            return 130
        case Row.DustDetail.rawValue:
            return 450
        default:
            return 0
        }
    }
}

extension MainViewController: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        switch status {
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            locationAuthCheckAlert()
            break
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager?.updatingLocation()
            updateRegion(notification: nil)
        }
    }
}
