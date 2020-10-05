//
//  UserNameStackView.swift
//  VKCloneWithoutStoryboard
//
//  Created by Vitaly Prosvetov on 22.09.2020.
//  Copyright © 2020 Vitaly Prosvetov. All rights reserved.
//

import UIKit

class UsersDataStackView: UIStackView {
    
    let nameLabel = UILabel()
    let nameTextField = UITextField()
   
    //MARK: - Initialization
    
    init(nameLabel: String, placeholder: String) {
        super.init(frame: .zero)
        
        axis = NSLayoutConstraint.Axis.vertical
        alignment = .center
        spacing = 10
        
        setupNameLabel(with: nameLabel)
        setupNameTextField(with: placeholder )
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Constraints
    
    override func updateConstraints() {
        super.updateConstraints()
        
        NSLayoutConstraint.activate([
            nameTextField.widthAnchor.constraint(equalToConstant: 350),
            nameTextField.heightAnchor.constraint(equalToConstant: 34)
        ])
    }
    
    
    //MARK: - Settings
        
    private func setupNameLabel(with name: String) {
        nameLabel.text = name
        nameLabel.font = UIFont.systemFont(ofSize: 20)
        nameLabel.textColor = UIColor(named: "LoginLabelsColor")
        
        addArrangedSubview(nameLabel)
    }
    
    private func setupNameTextField(with placeholder: String) {
        nameTextField.placeholder = placeholder
        nameTextField.backgroundColor = UIColor(named: "LoginLabelsColor")
        nameTextField.borderStyle = .roundedRect
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        addArrangedSubview(nameTextField)
        
        setNeedsUpdateConstraints()
    }
    
}
