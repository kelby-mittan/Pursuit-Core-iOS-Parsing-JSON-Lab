//
//  Colors.swift
//  Parsing-JSON-Lab2
//
//  Created by Kelby Mittan on 11/26/19.
//  Copyright © 2019 Kelby Mittan. All rights reserved.
//

import Foundation


struct Colors: Codable {
    let name: String
    let rgb: [String : Double]
    let hexString: String
}


extension Colors {
    // parse the "topStoriesTechnology.json" into an array of [NewsHeadline] objects
    static func getColors() -> [Colors] {
        
        var color = [Colors]()
        
        
        guard let fileURL = Bundle.main.url(forResource: "colors", withExtension: "json") else {
            fatalError("could not locate json file")
        }
        
        
        do {
            let data = try Data(contentsOf: fileURL)
                        
            let colorData = try JSONDecoder().decode([Colors].self, from: data)
            color = colorData
            
        } catch {
            fatalError("contents failed to load \(error)")
        }
        
        return color
    }
}
