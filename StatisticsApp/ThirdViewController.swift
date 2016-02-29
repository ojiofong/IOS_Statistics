//
//  ThirdViewController.swift
//  StatisticsApp
//
//  Created by Oji Ofong on 2/14/16.
//  Copyright © 2016 Oji Ofong. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    var textVal = "Default text value"
    @IBOutlet weak var label: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        label.text = textVal
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = textVal
    }

}
