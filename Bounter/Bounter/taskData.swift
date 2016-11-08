//
//  taskData.swift
//  Bounter
//
//  Created by airshiner on 11/8/16.
//  Copyright © 2016 airshiner. All rights reserved.
//

import Foundation

struct taskData {
    var taskTitle: String
    var taskTime: String
    var taskPosition: String
    var taskPay: Double
    var taskTag:String
    init(taskTitle: String, taskTime: String, taskPosition: String, taskPay: Double, taskTag: String) {
        self.taskTitle = taskTitle
        self.taskTime = taskTime
        self.taskPosition = taskPosition
        self.taskPay = taskPay
        self.taskTag = taskTag
    }
}
