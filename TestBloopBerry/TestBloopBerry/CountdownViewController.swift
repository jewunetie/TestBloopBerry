//
//  CountdownViewController.swift
//  TestBloopBerry
//
//  Created by Jhonatan Ewunetie on 7/25/19.
//  Copyright © 2019 Jhonatan Ewunetie. All rights reserved.
//

import UIKit

class CountdownViewController: UIViewController {
    var minutes: Int = 0
    var time: Time = Time.init()
    var timer: Timer = Timer.init()
    
    @IBOutlet weak var countdownLabel: UILabel!
    @IBOutlet weak var startStopButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    func countdown() {
        time.changeSeconds(-1)
        countdownLabel.text = time.timeString()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        time.minutes = minutes
        countdownLabel.text = time.timeString()
        timerCount()
        // Do any additional setup after loading the view.
    }
    
    func timerCount() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {_ in self.countdown()})
    }
    
    @IBAction func pressedStartStopButton(_ sender: Any) {
        if startStopButton.currentTitle == "Pause" {
            startStopButton.setTitle("Start", for: .normal)
            timer.invalidate()
        } else {
            startStopButton.setTitle("Pause", for: .normal)
            timerCount()
        }
    }
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        timer.invalidate()
        startStopButton.setTitle("Start", for: .normal)
        time.minutes = minutes
        countdownLabel.text = time.timeString()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
