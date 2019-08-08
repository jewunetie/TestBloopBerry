//
//  ViewController.swift
//  TestBloopBerry
//
//  Created by Jhonatan Ewunetie on 7/25/19.
//  Copyright © 2019 Jhonatan Ewunetie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var minutesStepper: UIStepper!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        minutesLabel.text = "0"
    }

    @IBAction func changeMinutes(_ sender: UIStepper) {
        minutesLabel.text = Int(sender.value).description
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let CountdownViewController = segue.destination as? CountdownViewController, let minutesToSend = Int(minutesLabel.text!) {
            CountdownViewController.minutes = minutesToSend
        }
    }
    
}

