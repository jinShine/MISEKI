//
//  SearchAddressViewController.swift
//  FineDust_Copy
//
//  Created by 승진김 on 28/02/2019.
//  Copyright © 2019 승진김. All rights reserved.
//

import UIKit

final class SearchAddressViewController: UIViewController {
    //MARK:- UI Constant

    private struct UI {
        static let headerConstainerHeight: CGFloat = 200
        static let basicMargin: CGFloat = 16
        static let searchbarMargin: CGFloat = 8
        static let basicImageSize: CGFloat = 20
        static let keyboardShowDuration: TimeInterval = 0.25
    }
    
    private enum Row: Int {
        case currentLocation = 0
        case recentSearch
    }
    
    
    //MARK:- UI Property
    
    let headerContainerView: UIView = {
        let view = UIView()
        return view
    }()
    
    let naviRightCloseButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Close"), for: UIControl.State.normal)
        return button
    }()
    
    let headerTitle: UILabel = {
        let label = UILabel()
        label.text = "위치 설정"
        return label
    }()
    
    lazy var searchAddressSearchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "도로명/건물명/지번"
        searchBar.barTintColor = .white
        searchBar.backgroundImage = UIImage()
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = .white
        searchBar.delegate = self
        return searchBar
    }()
    
    let separateLine: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = .clear
        tableView.allowsSelection = false
        tableView.tableFooterView = UIView()
        tableView.register(CurrentLocationCell.self, forCellReuseIdentifier: String(describing: CurrentLocationCell.self))
        tableView.register(SearchedAddressCell.self, forCellReuseIdentifier: String(describing: SearchedAddressCell.self))
        return tableView
    }()
    
    
    
    
    //MARK:- Properties
    private var searchAddressService: AddressServiceType?
    private var addressArray = [Juso]()
    
    //MARK:- Initialize
    init(addressService: AddressService) {
        super.init(nibName: nil, bundle: nil)
        
        self.searchAddressService = addressService
        
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
        setupNotification()
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    
    //MARK:- Setup
    
    private func setupUI() {
        
        view.backgroundColor = .white
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        [tableView, headerContainerView, separateLine].forEach { view.addSubview($0) }
        
        [naviRightCloseButton, headerTitle, searchAddressSearchBar].forEach {
            headerContainerView.addSubview($0)
        }
        
        naviRightCloseButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            naviRightCloseButton.topAnchor.constraint(equalTo: headerContainerView.topAnchor, constant: UI.basicMargin),
            naviRightCloseButton.trailingAnchor.constraint(equalTo: headerContainerView.trailingAnchor, constant: -UI.basicMargin),
            naviRightCloseButton.heightAnchor.constraint(equalToConstant: UI.basicImageSize),
            naviRightCloseButton.widthAnchor.constraint(equalToConstant: UI.basicImageSize)
        ])
        
        
        headerContainerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerContainerView.heightAnchor.constraint(equalToConstant: UI.headerConstainerHeight)
        ])
        
        headerTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerTitle.bottomAnchor.constraint(equalTo: searchAddressSearchBar.topAnchor, constant: -UI.basicMargin * 3),
            headerTitle.leadingAnchor.constraint(equalTo: headerContainerView.leadingAnchor, constant: UI.basicMargin),
            headerTitle.trailingAnchor.constraint(equalTo: headerContainerView.trailingAnchor, constant: -UI.basicMargin)
        ])
        
        searchAddressSearchBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchAddressSearchBar.bottomAnchor.constraint(equalTo: headerContainerView.bottomAnchor, constant: -UI.searchbarMargin),
            searchAddressSearchBar.leadingAnchor.constraint(equalTo: headerContainerView.leadingAnchor, constant: UI.searchbarMargin),
            searchAddressSearchBar.trailingAnchor.constraint(equalTo: headerContainerView.trailingAnchor, constant: -UI.searchbarMargin)
        ])
        
        separateLine.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            separateLine.topAnchor.constraint(equalTo: headerContainerView.bottomAnchor, constant: 0),
            separateLine.leadingAnchor.constraint(equalTo: headerContainerView.leadingAnchor),
            separateLine.trailingAnchor.constraint(equalTo: headerContainerView.trailingAnchor),
            separateLine.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: separateLine.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIApplication.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIApplication.keyboardWillHideNotification, object: nil)
    }
    
    
    
    //MARK:- Action Handle
    
    @objc func keyboardWillShow(notification: Notification) {
        guard let notiInfo = notification.userInfo else { return }
        guard let keyboardFrame = notiInfo["UIKeyboardFrameEndUserInfoKey"] as? CGRect else { return }
        let keyboardHeight = keyboardFrame.height
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)

        UIView.animate(withDuration: UI.keyboardShowDuration) {
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        UIView.animate(withDuration: UI.keyboardShowDuration) {
            self.view.layoutIfNeeded()
        }
    }
    
    // 중복 제거
    private func deduplication(from array: [Juso]) -> [Juso] {
        var set = Set<String>()
        let result = array.filter {
            guard !set.contains($0.emdNm) else { return false }
            set.insert($0.emdNm)
            return true
        }
        return result
    }
    
    private func requestAddress(region: String) {
        searchAddressService?.requestAddress(regionName: region, completion: { [weak self] response in
            switch response {
            case .success(let value):
                guard let self = self else { return }
                print("requestAddress", value)
                self.addressArray = self.deduplication(from: value.results.juso)
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        })
    }
    

    
}

extension SearchAddressViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addressArray.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case Row.currentLocation.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CurrentLocationCell.self), for: indexPath) as? CurrentLocationCell else { return UITableViewCell() }
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SearchedAddressCell.self), for: indexPath) as? SearchedAddressCell else { return UITableViewCell() }
            
            let jusos = self.addressArray[indexPath.row - 1]
            cell.configureWith(jusoModel: jusos)
            
            return cell
        }
    }
}

extension SearchAddressViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 46
    }
}

extension SearchAddressViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        DispatchQueue.main.async {
            print(searchText)
            if searchText.isEmpty {
                self.addressArray = []
            } else {
                self.requestAddress(region: searchText)
            }
            self.tableView.reloadData()
        }
    }
}
