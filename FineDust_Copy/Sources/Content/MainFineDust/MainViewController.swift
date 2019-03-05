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
        static let tableViewHeight: CGFloat = 830
    }
    
    
    //MARK:- UI Property
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = .clear
        tableView.backgroundColor = .clear
        tableView.allowsSelection = false
        tableView.tableFooterView = UIView()
        tableView.register(MainFineDustCell.self, forCellReuseIdentifier: String(describing: MainFineDustCell.self))
        return tableView
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
        
        
        
        
        
        

        setupUI()
        guard locationManager?.isUseLocationService() ?? false else {
            locationAuthCheckAlert()
            return
        }
        locationManager?.reverseGeocoderLocation { [weak self] placeMark in
            DispatchQueue.main.async {
                guard let city = placeMark.administrativeArea else { return }
                self?.placeMark = PlaceMark(placeMark: placeMark)
                self?.requestFineDust(city: city.convertCityShortening)
            }
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    
    
    
    //MARK:- Setup
    
    private func setupUI() {
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        [tableView].forEach { view.addSubview($0) }
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
    
    
    //MARK:- Action Handle
    
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
    
    
    
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MainFineDustCell.self), for: indexPath) as? MainFineDustCell else { return UITableViewCell() }
        
        cell.delegate = self
        cell.configureWith(data: mainFineDusts, placeMark: placeMark ?? PlaceMark())
        
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 830
    }
}

extension MainViewController: MainFineDustCellDelegate {
    
    func mainFineDustCell(_ mainFineDustCell: MainFineDustCell, didTapLocationButton: UIButton) {
        
        
//        self.navigationController?.pushViewController(SearchAddressViewController(), animated: true)
        present(SearchAddressViewController(addressService: AddressService()), animated: true, completion: nil)
        
    }
    
}
