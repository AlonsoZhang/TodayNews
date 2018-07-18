//
//  UserDetailBottomPushController.swift
//  TodayNews
//
//  Created by Alonso on 2018/7/18.
//  Copyright © 2018 Alonso. All rights reserved.
//

import UIKit

import WebKit

class UserDetailBottomPushController: UIViewController {
    
    var url: String?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let webView = WKWebView()
        webView.frame = view.bounds
        webView.load(URLRequest(url: URL(string: url!)!))
        view.addSubview(webView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
