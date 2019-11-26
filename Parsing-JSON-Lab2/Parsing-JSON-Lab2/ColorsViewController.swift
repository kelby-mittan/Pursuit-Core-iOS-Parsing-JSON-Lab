//
//  ColorsViewController.swift
//  Parsing-JSON-Lab2
//
//  Created by Kelby Mittan on 11/25/19.
//  Copyright © 2019 Kelby Mittan. All rights reserved.
//

import UIKit

class ColorsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var colorsArr = [Colors]() {
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
        colorsArr = Colors.getColors()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        guard let colorVC = segue.destination as? ColorsDetailController, let indexPath = tableView.indexPathForSelectedRow else {
            return
        }

        colorVC.color = colorsArr[indexPath.row]
    }
    
    
}

extension ColorsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorsArr.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        
        let color = colorsArr[indexPath.row]
        
        guard let r = color.rgb["r"], let g = color.rgb["g"], let b = color.rgb["b"] else {
            fatalError()
        }
        
        cell.textLabel?.text = color.name
        cell.backgroundColor? = UIColor(displayP3Red: CGFloat(r / 255), green: CGFloat(g / 255), blue: CGFloat(b / 255), alpha: 1.0)
        
        
        return cell
    }
    
    
}
