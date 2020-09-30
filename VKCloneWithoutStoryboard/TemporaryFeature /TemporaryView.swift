//
//  TemporaryView.swift
//  VKCloneWithoutStoryboard
//
//  Created by Vitaly Prosvetov on 28.09.2020.
//  Copyright © 2020 Vitaly Prosvetov. All rights reserved.
//

import UIKit

class TemporaryView: UIView {
    
    let mainStackView = UIStackView()
    let searchStackView = UIStackView()
    let friendsButton = UIButton()
    let photosButton = UIButton()
    let groupsButton = UIButton()
    let searchGroupsButton = UIButton()
    let searchTextField = UITextField()
    
    //MARK: - Initialization
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Constraints
    
    override func updateConstraints() {
        super.updateConstraints()
        
        NSLayoutConstraint.activate([
            mainStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            mainStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            searchStackView.heightAnchor.constraint(equalToConstant: 50),
            searchStackView.widthAnchor.constraint(equalToConstant: 250),
            
            friendsButton.heightAnchor.constraint(equalToConstant: 50),
            friendsButton.widthAnchor.constraint(equalToConstant: 250),
            
            photosButton.heightAnchor.constraint(equalToConstant: 50),
            photosButton.widthAnchor.constraint(equalToConstant: 250),
            
            groupsButton.heightAnchor.constraint(equalToConstant: 50),
            groupsButton.widthAnchor.constraint(equalToConstant: 250),
            
            searchTextField.leadingAnchor.constraint(equalTo: searchStackView.leadingAnchor),
            searchTextField.heightAnchor.constraint(equalToConstant: 55),
            
            searchGroupsButton.heightAnchor.constraint(equalToConstant: 50),
            searchGroupsButton.widthAnchor.constraint(equalToConstant: 50),
            searchGroupsButton.trailingAnchor.constraint(equalTo: searchStackView.trailingAnchor)
        ])
    }
}
