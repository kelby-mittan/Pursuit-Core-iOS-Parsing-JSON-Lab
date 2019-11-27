//
//  UserDetailController.swift
//  Parsing-JSON-Lab2
//
//  Created by Kelby Mittan on 11/26/19.
//  Copyright © 2019 Kelby Mittan. All rights reserved.
//

import UIKit

class UserDetailController: UIViewController {
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var dob: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    var user: Users?
    
    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d, yyyy h:mm a"
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    func getDateFromString(dateString: String) -> Date? {
      let formatter = ISO8601DateFormatter()
      formatter.formatOptions = [.withInternetDateTime,
                                 .withDashSeparatorInDate,
                                 .withFullDate,
                                 .withFractionalSeconds,
                                 .withColonSeparatorInTimeZone]
      guard let date = formatter.date(from: dateString) else {
        return nil
      }
      return date
    }
    
    func updateUI() {
        guard let validUser = user else {
            fatalError("could not load user")
        }
        
        addressLabel.text = """
        \(validUser.name["last"] ?? ""), \(validUser.name["first"] ?? "") - \(validUser.dob.age.description)
        
        \(validUser.location.street.number.description) \(validUser.location.street.name)
        \(validUser.location.city), \(validUser.location.state), \(validUser.location.country) \(validUser.location.postcode.extractValue())
        """
        guard let date = getDateFromString(dateString: validUser.dob.date) else {
            return
        }
        
        dob.text = dateFormatter.string(from: date)
        
        numberLabel.text = "Phone: \(validUser.phone)"
        
    }
    
}
