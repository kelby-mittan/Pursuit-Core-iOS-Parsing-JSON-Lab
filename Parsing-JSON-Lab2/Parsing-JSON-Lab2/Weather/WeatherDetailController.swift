//
//  WeatherDetailController.swift
//  Parsing-JSON-Lab2
//
//  Created by Kelby Mittan on 11/26/19.
//  Copyright © 2019 Kelby Mittan. All rights reserved.
//

import UIKit

class WeatherDetailController: UIViewController {
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    
    var cityWeather: CityWeather?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    func updateUI() {
        guard let validWeather = cityWeather else {
            fatalError("could not load weather")
        }
        navigationItem.title = validWeather.name
        tempLabel.text = "Tempurature: \(validWeather.main["temp"]?.description ?? "0")"
        weatherLabel.text = "Weather: \(validWeather.weather[0].description)"
    }
    

}
