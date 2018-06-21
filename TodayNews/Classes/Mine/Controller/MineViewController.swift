//
//  MineViewController.swift
//  TodayNews
//
//  Created by Alonso on 2018/6/21.
//  Copyright © 2018 Alonso. All rights reserved.
//

import UIKit

class MineViewController: UITableViewController {

    // 存储 cell的数据
    var sections = [[MyCellModel]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = UIColor.globalBackgroundColor()
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: String(describing: MyFisrtSectionCell.self), bundle: nil), forCellReuseIdentifier: String(describing: MyFisrtSectionCell.self))
        tableView.register(UINib(nibName: String(describing: MyOtherCell.self), bundle: nil), forCellReuseIdentifier: String(describing: MyOtherCell.self))
        // 获取我的 cell 的数据
        NetworkTool.loadMyCellData {
            self.sections = $0
            self.tableView.reloadData()
        }
    }

}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension MineViewController {
    
    // 每组头部的高度
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 1 ? 0 : 10
    }
    
    // 每组头部视图
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 10))
        view.backgroundColor = UIColor.globalBackgroundColor()
        return view
    }
    // 行高
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    // 组数
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    // 每组的行数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].count
    }
    // cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 && indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MyFisrtSectionCell.self)) as! MyFisrtSectionCell
            let section = sections[indexPath.section]
            let myCellModel = section[indexPath.row]
            cell.leftLabel.text = myCellModel.text
            cell.rightLabel.text = myCellModel.grey_text
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MyOtherCell.self)) as! MyOtherCell
        let section = sections[indexPath.section]
        let myCellModel = section[indexPath.row]
        cell.leftLabel.text = myCellModel.text
        cell.rightLabel.text = myCellModel.grey_text
        return cell
    }
}
