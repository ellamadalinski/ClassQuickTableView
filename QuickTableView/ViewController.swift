//
//  ViewController.swift
//  QuickTableView
//
//  Created by ELLA MADALINSKI on 10/18/21.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    var numbers : [Int] = []
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    let defaults = UserDefaults.standard // variable to store otp
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        if let nums = defaults.object(forKey: "myNumbers"){
            numbers = nums as! [Int]
        }
        for i in 0..<30 {
            numbers.append(i*5)
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func saveAction(_ sender: UIBarButtonItem) {
        defaults.set(numbers, forKey: "myNumbers")
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }
    
    //gets looped for you and fills out every cell in each row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        //cell.textLabel?.text = String(indexPath.row)
        cell.textLabel?.text = String(numbers[indexPath.row])
        cell.detailTextLabel?.text = "hi"
        return cell
    }

}

