//
//  SearchedAddressCell.swift
//  FineDust_Copy
//
//  Created by 승진김 on 05/03/2019.
//  Copyright © 2019 승진김. All rights reserved.
//

import UIKit

class SearchedAddressCell: UITableViewCell {
    
    //MARK:- UI
    
    struct UI {
        static let basicMargin: CGFloat = 16
    }
    
    //MARK:- UI Properties
    
    let searchedTitle: UILabel = {
        let label = UILabel()
        return label
    }()
    
    
    
    //MARK:- Properties
    
    
    
    
    
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
        
        [searchedTitle].forEach { addSubview($0) }
        searchedTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchedTitle.centerYAnchor.constraint(equalTo: centerYAnchor),
            searchedTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: UI.basicMargin),
            searchedTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -UI.basicMargin)
        ])
        
    }
    
    //MARK:- Actiion Handler
    
    func configureWith(jusoModel: Juso) {
        let address = "\(jusoModel.siNm) " + "\(jusoModel.sggNm) " + "\(jusoModel.emdNm)"
        self.searchedTitle.text = address
    }
}
