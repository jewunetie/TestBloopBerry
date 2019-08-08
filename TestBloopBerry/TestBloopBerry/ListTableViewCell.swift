//
//  ListTableViewCell.swift
//  TestBloopBerry
//
//  Created by Jhonatan Ewunetie on 7/26/19.
//  Copyright © 2019 Jhonatan Ewunetie. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    @IBOutlet weak var taskLabel: UITextField!
    @IBOutlet weak var checkboxButton: UIButton!
    @IBOutlet weak var deadlineLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        checkboxButton.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        taskLabel.placeholder = "Add Task"
        taskLabel.isEnabled = false
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // taskLabel.isEnabled = true
        // Configure the view for the selected state
    }
    
    @IBAction func checkboxButtonPressed(_ sender: Any) {
        if checkboxButton.currentTitle == "☐" {
            checkboxButton.setTitle("☑", for: .normal)
            checkboxButton.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.25), for: .normal)
            taskLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25)
            deadlineLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25)
            minuteLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25)
        } else {
            checkboxButton.setTitle("☐", for: .normal)
            checkboxButton.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
            taskLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
            deadlineLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
            minuteLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        }
    }
    
    
    
    
}
