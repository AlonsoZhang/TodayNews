//
//  OfflineDownloadController.swift
//  TodayNews
//
//  Created by Alonso on 2018/7/2.
//  Copyright © 2018 Alonso. All rights reserved.
//

import UIKit

class OfflineDownloadController: UITableViewController {
    // 标题数组
    private var titles = [HomeNewsTitle]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "离线下载"
        tableView.ym_registerCell(cell: OfflineDownlaodCell.self)
        tableView.rowHeight = 44
        tableView.sectionHeaderHeight = 44
        tableView.theme_separatorColor = "colors.separatorViewColor"
        tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
        tableView.theme_backgroundColor = "colors.tableViewBackgroundColor"
        // 从数据库中取出左右数据，赋值给 标题数组 titles
        titles = NewsTitleTable().selectAll()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

// MARK: - UITableViewDelegate, UItableViewDataSource
extension OfflineDownloadController {
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 44))
        view.theme_backgroundColor = "colors.tableViewBackgroundColor"
        let label = UILabel(frame: CGRect(x: 20, y: 0, width: screenWidth, height: 44))
        label.text = "我的频道"
        label.theme_textColor = "colors.black"
        let separatorView = UIView(frame: CGRect(x: 0, y: 43, width: screenWidth, height: 1))
        separatorView.theme_backgroundColor = "colors.separatorViewColor"
        view.addSubview(separatorView)
        view.addSubview(label)
        return view
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.ym_dequeueReusableCell(indexPath: indexPath) as OfflineDownlaodCell
        let newsTitle = titles[indexPath.row]
        cell.titleLabel.text = newsTitle.name
        cell.rightImageView.theme_image = newsTitle.selected ? "images.air_download_option_press" : "images.air_download_option"
        return cell
    }
}
