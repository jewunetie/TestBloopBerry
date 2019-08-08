//
//  ListTableViewController.swift
//  TestBloopBerry
//
//  Created by Jhonatan Ewunetie on 7/26/19.
//  Copyright © 2019 Jhonatan Ewunetie. All rights reserved.
//

import UIKit

var defaultTask = Task.init()
class ListTableViewController: UITableViewController {
    
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    var taskList: TaskManager = TaskManager.init(listofTasks: [])
    
    @IBOutlet var listTableView: UITableView!
    @IBOutlet var addTaskPopOver: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskList = appDelegate.secondTaskManager
        taskList.printTasks()
        taskList.sort()
        taskList.printTasks()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        appDelegate.taskManager = taskList
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return taskList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listTableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! ListTableViewCell
        let item = taskList.listOfTasks[indexPath.row]
        cell.taskLabel.text = item.title + item.priorityToStr()
        cell.deadlineLabel.text = item.dateToStr()
        cell.minuteLabel.text = "🕒 " + item.minutes.description + " Min"
        if item.isComplete {
            cell.checkboxButton.setTitle("☐", for: .normal)
        } else {
            cell.checkboxButton.setTitle("☑", for: .normal)
        }
        cell.checkboxButtonPressed(Any.self)
        cell.backgroundColor = item.typeToColor()
        return cell
    }
    
    @IBAction func addTaskButtonPressed(_ sender: Any) {

        self.view.addSubview(addTaskPopOver)
        self.addTaskPopOver.center = self.view.center
        self.addTaskPopOver.layer.cornerRadius = 20
    }
    
    // SUBVIEW OUTLETS AND FUNCTIONS
    
    @IBOutlet weak var addTaskTextField: UITextField!
    @IBOutlet weak var addDeadlinePicker: UIDatePicker!
    @IBOutlet weak var taskTypeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var prioritySegmentedControl: UISegmentedControl!
    @IBOutlet weak var addMinutesLabel: UILabel!
    
    
    @IBAction func changeMinutes(_ sender: UIStepper) {
        addMinutesLabel.text = Int(sender.value).description
    }
    
    @IBAction func addTaskDoneButtonPressed(_ sender: Any) {
        var newTask: Task = Task.init()
        newTask.title = addTaskTextField.text!
        newTask.deadline = addDeadlinePicker.date
        
        let typeTitle = taskTypeSegmentedControl.titleForSegment(at: taskTypeSegmentedControl.selectedSegmentIndex)!
        newTask.strToType(str: typeTitle)
        
        let priorityTitle = prioritySegmentedControl.titleForSegment(at: taskTypeSegmentedControl.selectedSegmentIndex)!
        newTask.strToPriority(str: priorityTitle)
        
        newTask.minutes = Int16(addMinutesLabel.text!)!
        newTask.isComplete = false
        
        taskList.addTask(newTask: newTask)
        
        listTableView.reloadData()
        self.addTaskPopOver.removeFromSuperview()
    }
    
    @IBAction func addTaskCancelButtonPressed(_ sender: Any) {
        self.addTaskPopOver.removeFromSuperview()
    }
    
    @IBAction func dragDownExitPopOver(_ sender: UIPanGestureRecognizer) {
        self.addTaskPopOver.center.y = self.view.center.y + sender.translation(in: addTaskPopOver).y
        if (sender.numberOfTouches == 0) {
            if (sender.velocity(in: self.addTaskPopOver).y > 500) {
                self.addTaskPopOver.removeFromSuperview()
            } else {
                self.addTaskPopOver.center.y = self.view.center.y
            }
        }
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
