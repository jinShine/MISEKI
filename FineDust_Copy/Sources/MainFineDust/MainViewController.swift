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
    
    struct UI {
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
    
    
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        setupUI()
        
        let dd = FineDustService()
        dd.fetchFineDustInfo { response in
            guard let dd = response.value, let fir = dd.first else { return }
//            print("ERORORORO", fir.list)
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
        
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 830
    }
}
