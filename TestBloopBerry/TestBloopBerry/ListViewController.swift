//
//  ListViewController.swift
//  TestBloopBerry
//
//  Created by Jhonatan Ewunetie on 7/25/19.
//  Copyright © 2019 Jhonatan Ewunetie. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var listTable: UITableView!
    
    var taskList: [String] = ["task1", "task2", "task3"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listTable.dequeueReusableCell(withIdentifier: "listCell", for: indexPath)
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //listTable.register(UINib(nibName: "listCell", bundle: nil), forCellReuseIdentifier: "listCell")
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
