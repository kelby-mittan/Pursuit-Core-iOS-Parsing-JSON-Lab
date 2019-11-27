//
//  RanUserController.swift
//  Parsing-JSON-Lab2
//
//  Created by Kelby Mittan on 11/25/19.
//  Copyright © 2019 Kelby Mittan. All rights reserved.
//

import UIKit

class RanUserController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var userArr = [Users]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        loadData()
    }
    
    func loadData() {
        userArr = UserData.getUsers()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        guard let userVC = segue.destination as? UserDetailController, let indexPath = tableView.indexPathForSelectedRow else {
            return
        }

        userVC.user = userArr[indexPath.row]
    }
    
    
}

extension RanUserController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArr.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        
        let user = userArr[indexPath.row]
        
        cell.textLabel?.text = "\(user.name["last"] ?? ""), \(user.name["first"] ?? "")"
        cell.detailTextLabel?.text = user.email
        
        
        return cell
    }
    
    
}
