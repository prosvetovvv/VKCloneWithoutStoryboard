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
    
    
    var textLabel: String
    var placeholder: String
    
    //MARK: - Initialization
    
    init(nameLabel: String, placeholder: String) {
        self.textLabel = nameLabel
        self.placeholder = placeholder
        super.init(frame: .zero)
        
        setupUserPasswordStackView()
        setupUserNameLabel()
        setupUserNameTextField()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        NSLayoutConstraint.activate([
            nameTextField.widthAnchor.constraint(equalToConstant: 350),
            nameTextField.heightAnchor.constraint(equalToConstant: 34)
        ])
    }
    
    
    //MARK: - Settings
    
    private func setupUserPasswordStackView() {
        axis = NSLayoutConstraint.Axis.vertical
        alignment = .center
        spacing = 10
        
    }
    
    private func setupUserNameLabel() {
        nameLabel.text = textLabel
        nameLabel.font = UIFont.systemFont(ofSize: 20)
        nameLabel.textColor = UIColor(named: "LoginLabelsColor")
        
        addArrangedSubview(nameLabel)
    }
    
    private func setupUserNameTextField() {
        nameTextField.placeholder = placeholder
        nameTextField.backgroundColor = UIColor(named: "LoginLabelsColor")
        nameTextField.borderStyle = .roundedRect
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        addArrangedSubview(nameTextField)
        
        setNeedsUpdateConstraints()
        
    }
    
}
