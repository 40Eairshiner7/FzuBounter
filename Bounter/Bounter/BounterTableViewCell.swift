//
//  TableViewCell.swift
//  Bounter
//
//  Created by airshiner on 11/6/16.
//  Copyright © 2016 airshiner. All rights reserved.
//

import UIKit

class BounterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var rectangle: UIImageView!
    @IBOutlet weak var select: UIImageView!
    @IBOutlet weak var wrightLabel: UILabel!
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
            rectangle.isHidden = false
        }else {
            rectangle.isHidden = true
        }
    }
    
    public func showSelect() {
        if willSelect == true {
            select.isHidden = false
        }else {
            select.isHidden = true
        }
    }
    
}
