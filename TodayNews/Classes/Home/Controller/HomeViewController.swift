//
//  HomeViewController.swift
//  TodayNews
//
//  Created by Alonso on 2018/6/21.
//  Copyright © 2018 Alonso. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        // 首页顶部新闻标题的数据
        NetworkTool.loadHomeNewsTitleData { (titles) in
            // 向数据库中插入数据
            NewsTitleTable().insert(titles)
        }
    }
}
