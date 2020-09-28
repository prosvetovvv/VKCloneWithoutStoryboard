//
//  ViewController.swift
//  VKCloneWithoutStoryboard
//
//  Created by Vitaly Prosvetov on 22.09.2020.
//  Copyright © 2020 Vitaly Prosvetov. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    lazy var loginScrollView = LoginScrollView(view: view)
    
    //    lazy var contentViewSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
    //    lazy var loginScrollView = LoginScrollView(view: view, contentViewSize: contentViewSize)
    //    lazy var userStackView = UsersDataStackView(nameLabel: "User Name", placeholder: "User name")
    //    lazy var passwordStackView = UsersDataStackView(nameLabel: "Password", placeholder: "Password")
    //
    //    lazy var mainStackView: UIStackView = {
    //        let mainStackView = UIStackView()
    //
    //        mainStackView.axis = NSLayoutConstraint.Axis.vertical
    //        mainStackView.alignment = .center
    //        mainStackView.spacing = 30
    //
    //        mainStackView.addArrangedSubview(userStackView)
    //        mainStackView.addArrangedSubview(passwordStackView)
    //
    //        return mainStackView
    //    }()
    //
    //    lazy var logoLabel: UILabel = {
    //        let logoLabel = UILabel()
    //        logoLabel.text = "VKClone"
    //        logoLabel.font = UIFont(name: "American Typewriter", size: 25.0)
    //        logoLabel.textColor = UIColor(named: "LoginLabelsColor")
    //        return logoLabel
    //    }()
    //
    //    lazy var loginButton: UIButton = {
    //        let loginButton = UIButton()
    //        loginButton.setTitle("Login", for: .normal)
    //        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 25)
    //        loginButton.setTitleColor(UIColor(named: "LoginLabelsColor"), for: .normal)
    //        return loginButton
    //    }()
    
    
    
    //        override func loadView() {
    //            super.loadView()
    //
    //            view = LoginScrollView()
    //
    //        }
    
//        override func loadView() {
//            super.loadView()
//
//            view = LoginView(view: view)
//        }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        // Второе — когда она пропадает
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidLoad() {
        
        view.addSubview(loginScrollView)
        setLoginScrollViewConstraints()
        
        // Жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        // Присваиваем его UIScrollVIew
        loginScrollView.addGestureRecognizer(hideKeyboardGesture)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func setLoginScrollViewConstraints() {
        loginScrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        loginScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        loginScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        loginScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    // Когда клавиатура появляется
    @objc func keyboardWasShown(notification: Notification) {
        
        // Получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
        loginScrollView.contentInset = contentInsets
        loginScrollView.scrollIndicatorInsets = contentInsets
    }
    
    //Когда клавиатура исчезает
    @objc func keyboardWillBeHidden(notification: Notification) {
        
        // Устанавливаем отступ внизу UIScrollView, равный 0
        let contentInsets = UIEdgeInsets.zero
        loginScrollView.contentInset = contentInsets
    }
    
    @objc func hideKeyboard() {
        loginScrollView.endEditing(true)
    }
    
    
    //    override func viewDidLoad() {
    //        super.viewDidLoad()
    //
    //        view.addSubview(loginScrollView)
    //
    //        guard let containerView = loginScrollView.containerView else { return }
    //        containerView.addSubview(logoLabel)
    //        containerView.addSubview(mainStackView)
    //        containerView.addSubview(loginButton)
    //
    //        loginScrollView.translatesAutoresizingMaskIntoConstraints = false
    //        loginScrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    //        loginScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    //        loginScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    //        loginScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    //
    //        logoLabel.translatesAutoresizingMaskIntoConstraints = false
    //        logoLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
    //        logoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    //
    //
    //        mainStackView.translatesAutoresizingMaskIntoConstraints = false
    //        mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    //        mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    //
    //        loginButton.translatesAutoresizingMaskIntoConstraints = false
    //        loginButton.topAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: 100).isActive = true
    //        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    //
    //    }
    
    
}

