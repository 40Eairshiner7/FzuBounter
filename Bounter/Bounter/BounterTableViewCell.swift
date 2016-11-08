//
//  TableViewCell.swift
//  Bounter
//
//  Created by airshiner on 11/6/16.
//  Copyright © 2016 airshiner. All rights reserved.
//

import UIKit

class BounterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var rectangleIcon: UIImageView!
    
    @IBOutlet weak var wrightLabel: UILabel!
    
    @IBOutlet weak var selectIcon: UIImageView!
    
    var didSelect = true
    var willSelect = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func inputContent(textContent: String) {
        wrightLabel.text = textContent
    }
    
    public func showRectangle() {
        if didSelect == true {
            rectangleIcon.isHidden = false
        }else {
            rectangleIcon.isHidden = true
        }
    }
    
    public func showSelect() {
        if willSelect == true {
            selectIcon.isHidden = false
        }else {
            selectIcon.isHidden = true
        }
    }
    
}
