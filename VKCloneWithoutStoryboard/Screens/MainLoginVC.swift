//
//  MainLoginVC.swift
//  VKCloneWithoutStoryboard
//
//  Created by Vitaly Prosvetov on 28.09.2020.
//  Copyright © 2020 Vitaly Prosvetov. All rights reserved.
//

import UIKit
import WebKit

class MainLoginVC: UIViewController {
    
    let mainLoginView = MainLoginView()
    let session = Session.instance
    
    
    override func loadView() {
        super.loadView()
        
        view = mainLoginView
        mainLoginView.navigationDelegate = self
    }
}

extension MainLoginVC: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment  else {
            decisionHandler(.allow)
            return
        }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
        }
        
        let token = params["access_token"]
        
        guard token != nil else { return }
        session.token = token ?? " "
        
        let temporaryVC = TemporaryVC()
        present(temporaryVC, animated: true)
        
//        let tabBar = TabBarController()
//        tabBar.modalPresentationStyle = .fullScreen
//        present (tabBar, animated: true)
        
        decisionHandler(.cancel)
    }
}
