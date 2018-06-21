//
//  NetworkTool.swift
//  TodayNews
//
//  Created by Alonso on 2018/6/21.
//  Copyright © 2018 Alonso. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol NetworkToolProtocol {
    // MARK: - --------------------------------- 我的 mine  ---------------------------------
    // MARK: 我的界面 cell 的数据
    static func loadMyCellData(completionHandler: @escaping (_ sections: [[MyCellModel]]) -> ())
    // MARK: 我的关注数据
    static func loadMyConcern()
}

extension NetworkToolProtocol {
    // MARK: - --------------------------------- 我的 mine  ---------------------------------
    // MARK: 我的界面 cell 的数据
    static func loadMyCellData(completionHandler: @escaping (_ sections: [[MyCellModel]]) -> ()){
        let url = BASE_URL + "/user/tab/tabs/?"
        let params = ["device_id": device_id,
                      "iid": iid]
        Alamofire.request(url, parameters: params).responseJSON { (response) in
            // 网络错误的提示信息
            guard response.result.isSuccess else { return }
            if let value = response.result.value {
                let json = JSON(value)
                guard json["message"] == "success" else { return }
                var mySections = [[MyCellModel]]()
                mySections.append([MyCellModel.deserialize(from: "{\"text\":\"我的关注\",\"grey_text\":\"\"}")!])
                if let data = json["data"].dictionary {
                    if let sections = data["sections"]?.arrayObject {
                        mySections += sections.compactMap({ item in
                            (item as! [Any]).compactMap({ MyCellModel.deserialize(from: $0 as? Dictionary) })
                        })
                        completionHandler(mySections)
                    }
                }
            }
        }
    }
    // MARK: 我的关注数据
    static func loadMyConcern(){
        
    }
}

struct NetworkTool:NetworkToolProtocol {}
