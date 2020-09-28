//
//  LoginView.swift
//  VKCloneWithoutStoryboard
//
//  Created by Vitaly Prosvetov on 27.09.2020.
//  Copyright © 2020 Vitaly Prosvetov. All rights reserved.
//

//import UIKit
//
//class LoginView: UIView {
//
//    var loginScrollView = LoginScrollView()
//    
//    override init(frame: CGRect) {
//        super.init(frame: .zero)
//
//        addSubview(loginScrollView)
//        loginScrollView.translatesAutoresizingMaskIntoConstraints = false
//        setNeedsUpdateConstraints()
//
//    }
//
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    override func updateConstraints() {
//        super.updateConstraints()
//        
//        NSLayoutConstraint.activate([
//            loginScrollView.topAnchor.constraint(equalTo: topAnchor),
//            loginScrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
//            loginScrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            loginScrollView.trailingAnchor.constraint(equalTo: trailingAnchor)
//        ])
//        
//    }
//}
