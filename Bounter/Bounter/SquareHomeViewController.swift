//
//  SquareHomeViewController.swift
//  Bounter
//
//  Created by airshiner on 11/7/16.
//  Copyright © 2016 airshiner. All rights reserved.
//

import UIKit

class SquareHomeViewController: UITableViewController {
    
    @IBOutlet var pullOutMenu: UIPanGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "HomeViewControllerCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "HomeViewControllerCell")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
        
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeViewControllerCell") as! HomeViewControllerCell
        let tempTaskData = taskData(taskTitle: "任务内容标题",taskTime: "任务时间",taskPosition: "任务地点",taskPay: 0.00,taskTag: "任务标签")
        cell.inputContent(taskData: tempTaskData)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 123.0*(sHeight/667)
    }
}
