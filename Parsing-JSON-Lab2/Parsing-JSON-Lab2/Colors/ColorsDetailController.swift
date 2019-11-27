//
//  ColorsDetailController.swift
//  Parsing-JSON-Lab2
//
//  Created by Kelby Mittan on 11/26/19.
//  Copyright © 2019 Kelby Mittan. All rights reserved.
//

import UIKit

class ColorsDetailController: UIViewController {

    @IBOutlet weak var rgbLabel: UILabel!
    @IBOutlet weak var hexLabel: UILabel!
    
    var color: Colors?

    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }

    func updateUI() {
        guard let validColor = color, let r = validColor.rgb["r"], let g = validColor.rgb["g"], let b = validColor.rgb["b"] else {
            fatalError("could not load color")
        }
        navigationItem.title = validColor.name
        rgbLabel.text = "RGB: \(Int(r)), \(Int(g)), \(Int(b))"
        var hex = validColor.hexString
        hex.removeFirst()
        hexLabel.text = "Hex: \(hex.uppercased())"
    }
    

}
