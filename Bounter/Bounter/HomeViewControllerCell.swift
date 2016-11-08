//
//  homeViewControllerCell.swift
//  Bounter
//
//  Created by airshiner on 11/8/16.
//  Copyright © 2016 airshiner. All rights reserved.
//

import UIKit

class HomeViewControllerCell:UITableViewCell {
    
    @IBOutlet weak var paperPlaneIcon: UIImageView!
    @IBOutlet weak var grayLineView: UIView!
    @IBOutlet weak var tagIcon: UIImageView!
    @IBOutlet weak var taskTitleLabel: UILabel!
    @IBOutlet weak var tagTextLabel: UILabel!
    @IBOutlet weak var taskTimeLabel: UILabel!
    @IBOutlet weak var taskPositionLabel: UILabel!
    @IBOutlet weak var taskPayLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func inputContent(taskData: taskData) {
        taskTitleLabel.text = taskData.taskTitle
        taskTimeLabel.text = taskData.taskTime
        taskPositionLabel.text = taskData.taskPosition
        let correctedPay = String(format: "%.2f", taskData.taskPay)
        taskPayLabel.text = "￥\(correctedPay)"
        tagTextLabel.text = taskData.taskTag
    }
    
}
