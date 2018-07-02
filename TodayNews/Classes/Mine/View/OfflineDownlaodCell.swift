//
//  OfflineDownlaodCell.swift
//  TodayNews
//
//  Created by Alonso on 2018/7/2.
//  Copyright © 2018 Alonso. All rights reserved.
//

import UIKit

class OfflineDownlaodCell: UITableViewCell ,RegisterCellFromNib{

    /// 标题
    @IBOutlet weak var titleLabel: UILabel!
    /// 勾选图片
    @IBOutlet weak var rightImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        theme_backgroundColor = "colors.cellBackgroundColor"
        titleLabel.theme_textColor = "colors.black"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
