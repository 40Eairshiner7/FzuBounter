//
//  BounterMenuTable.swift
//  Bounter
//
//  Created by airshiner on 11/6/16.
//  Copyright © 2016 airshiner. All rights reserved.
//

import UIKit

class BounterMenuTableVC: UITableViewController {
    override func viewDidLoad() {
        var headView = UIView()
        super.viewDidLoad()
        let nib = UINib(nibName: "BounterTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "BounterTableViewCell")
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return 6
        default:
            return 2
        }
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BounterTableViewCell") as! BounterTableViewCell
        switch indexPath.section {
        
        case 0:
            if indexPath.row == 0 {
                cell.wrightLabel?.text = "按时间排序"
            }else {
                cell.wrightLabel?.text = "按热度排序"
            }
            
        case 1:
            if indexPath.row == 0 {
                cell.wrightLabel?.text = "学习交流"
            }else if indexPath.row == 1{
                cell.wrightLabel?.text = "物品交换"
            }else if indexPath.row == 2{
                cell.wrightLabel?.text = "团队任务"
            }else if indexPath.row == 3{
                cell.wrightLabel?.text = "用户互约"
            }else if indexPath.row == 4{
                cell.wrightLabel?.text = "待办事项"
            }else {
                cell.wrightLabel?.text = "情感专线"
            }
            
        default:
            if indexPath.row == 0 {
                cell.wrightLabel?.text = "支付宝"
            }else {
                cell.wrightLabel?.text = "当面交易"
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        var sectionTitle = ""
        switch section {
        case 0:
            sectionTitle = "排序方式"
        case 1:
            sectionTitle = "任务类型"
        default:
            sectionTitle = "赏金类型"
        }
        
        return sectionTitle
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48*(sHeight/667)
    }
    
}
