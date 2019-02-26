//
//  MainViewController.swift
//  FineDust_Copy
//
//  Created by 승진김 on 19/02/2019.
//  Copyright © 2019 승진김. All rights reserved.
//

import UIKit

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
        tableView.backgroundColor = UIColor.black
        tableView.allowsSelection = false
        tableView.tableFooterView = UIView()
        tableView.register(MainFineDustCell.self, forCellReuseIdentifier: String(describing: MainFineDustCell.self))
        return tableView
    }()
    
    
    
    //MARK:- Properties
    private var fineDustService: FineDustServiceType!
    private var mainFineDusts = MainFineDust()
    
    
    //MARK:- Initialize
    // Discuss
    // Dependency!!!!!!!!!!!!!!!!!!!!!!
    init(fineDustService: FineDustService) {
        super.init(nibName: nil, bundle: nil)
        self.fineDustService = fineDustService
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
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        setupUI()
        
        fineDustService.fetchFineDustInfo { [weak self] response in
            guard let self = self else { return }
            DispatchQueue.main.async {
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
    }
    
    
    //MARK:- Setup
    
    private func setupUI() {
        
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
    
    
    
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MainFineDustCell.self), for: indexPath) as? MainFineDustCell else { return UITableViewCell() }
        
        cell.configureWith(data: mainFineDusts)
        
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 830
    }
}
