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
        
    }
    
    
    //MARK:- UI Property
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
//        tableView.delegate = self
//        tableView.dataSource = self
        tableView.separatorColor = .clear
        tableView.backgroundColor = UIColor.black
        tableView.allowsSelection = false
        tableView.tableFooterView = UIView()
        tableView.register(MainFineDustCell.self, forCellReuseIdentifier: String(describing: MainFineDustCell.self))
        return tableView
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
        
        setupUI()
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
    
    
    
}
