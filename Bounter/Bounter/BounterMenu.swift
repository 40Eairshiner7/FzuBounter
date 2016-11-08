//
//  BounterMenu.swift
//  Bounter
//
//  Created by airshiner on 11/6/16.
//  Copyright © 2016 airshiner. All rights reserved.
//

import UIKit

class BounterMenuVC:UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var menuTableView: UITableView!
    
    var bounterMenuTableVC = BounterMenuTableVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layoutIfNeeded()
        self.automaticallyAdjustsScrollViewInsets = false
//        UIInit()
    }
    
//    func UIInit() {
//        bounterMenuTableVC.view.frame = CGRect(x: 0, y: 30, width:sWidth*(210/667), height: sHeight)
//        self.addChildViewController(bounterMenuTableVC)
//        bounterMenuTableVC.view.backgroundColor = UIColor.black
//        self.view.addSubview(bounterMenuTableVC.view)
//    }
//    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: TABLEVIEW DELEGATE
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return 6
        default:
            return 2
        }
    }
    private func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = BounterTableViewCell()
        
        switch indexPath.section {
            
        case 0:
            if indexPath.row == 0 {
                cell.textLabel?.text = "按时间排序"
            }else {
                cell.textLabel?.text = "按热度排序"
            }
            
        case 1:
            if indexPath.row == 0 {
                cell.textLabel?.text = "学习交流"
            }else if indexPath.row == 1{
                cell.textLabel?.text = "物品交换"
            }else if indexPath.row == 2{
                cell.textLabel?.text = "团队任务"
            }else if indexPath.row == 3{
                cell.textLabel?.text = "用户互约"
            }else if indexPath.row == 4{
                cell.textLabel?.text = "待办事项"
            }else {
                cell.textLabel?.text = "情感专线"
            }
            
        default:
            if indexPath.row == 0 {
                cell.textLabel?.text = "支付宝"
            }else {
                cell.textLabel?.text = "当面交易"
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
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

    
}
