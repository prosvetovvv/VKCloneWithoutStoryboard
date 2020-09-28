//
//  LoginScrollView.swift
//  VKCloneWithoutStoryboard
//
//  Created by Vitaly Prosvetov on 22.09.2020.
//  Copyright © 2020 Vitaly Prosvetov. All rights reserved.
//

import UIKit

//class LoginScrollView: UIScrollView {

//var containerView: UIView?

//    init(view: UIView, contentViewSize: CGSize) {
//        super.init(frame: .zero)
//
//        backgroundColor = UIColor(named: "LoginVCBackgroundColor")
//        frame = view.bounds
//        contentSize = contentViewSize
//        autoresizingMask = .flexibleHeight
//        showsHorizontalScrollIndicator = true
//        bounces = true
//
//        let containerView = UIView()
//        containerView.backgroundColor = UIColor(named: "LoginVCBackgroundColor")
//        //containerView.backgroundColor = .red
//        containerView.frame.size = contentViewSize
//
//        addSubview(containerView)
//
//        self.containerView = containerView
//
//    }



//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//}


class LoginScrollView: UIScrollView {
    
    let logoLabel = UILabel()
    let userNameLabel = UILabel()
    let userNameTextField = UITextField()
    let mainStackView = UIStackView()
    let userStackView = UsersDataStackView(nameLabel: "User Name", placeholder: "User name")
    let passwordStackView = UsersDataStackView(nameLabel: "Password", placeholder: "Password")
    let loginButton = UIButton()
    
    //MARK: - Initialization
    
    init(view: UIView) {
        super.init(frame: .zero)
        
        contentSize = CGSize(width: view.frame.width, height: view.frame.height)
        //isScrollEnabled = true
        backgroundColor = UIColor(named: "LoginVCBackgroundColor")
        //bounces = true
        //autoresizingMask = .flexibleHeight
        //showsHorizontalScrollIndicator = true
        
        translatesAutoresizingMaskIntoConstraints = false
        
        setupLogoLabel()
        setupMainStackView()
        setupLoginButton()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        NSLayoutConstraint.activate([
            logoLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            logoLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            mainStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            loginButton.topAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: 50),
            loginButton.centerXAnchor.constraint(equalTo: centerXAnchor)
            
        ])
    }
    
    //MARK: - Settings
    
    //    private func setupLoginScrollView() {
    //        //autoresizingMask = .flexibleHeight
    //        //showsVerticalScrollIndicator = true
    //        bounces = true
    //        isScrollEnabled = true
    //        //contentSize = contentViewSize
    //        //contentInset = contentInsets
    //        //scrollIndicatorInsets = contentInsets
    //        backgroundColor = UIColor(named: "LoginVCBackgroundColor")
    //        keyboardDismissMode = .onDrag
    //    }
    
    private func setupLogoLabel() {
        logoLabel.text = "VKClone"
        logoLabel.font = UIFont(name: "American Typewriter", size: 25.0)
        logoLabel.textColor = UIColor(named: "LoginLabelsColor")
        
        logoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(logoLabel)
        
        setNeedsUpdateConstraints()
    }
    
    private func setupMainStackView() {
        mainStackView.axis = NSLayoutConstraint.Axis.vertical
        mainStackView.alignment = .center
        mainStackView.spacing = 30
        
        mainStackView.addArrangedSubview(userStackView)
        mainStackView.addArrangedSubview(passwordStackView)
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(mainStackView)
        
        setNeedsUpdateConstraints()
    }
    
    private func setupLoginButton() {
        loginButton.setTitle("Login", for: .normal)
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        loginButton.setTitleColor(UIColor(named: "LoginLabelsColor"), for: .normal)
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(loginButton)
        
        setNeedsUpdateConstraints()
    }
    
}

