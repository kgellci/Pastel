//
//  ViewController.swift
//  Pastel
//
//  Created by cruz on 05/05/2017.
//  Copyright (c) 2017 cruz. All rights reserved.
//

import UIKit
import Pastel

class ViewController: UIViewController {
    @IBOutlet weak var loginButton: PastelButton! {
        didSet {
            loginButton.layer.borderColor = UIColor.white.withAlphaComponent(0.12).cgColor
            loginButton.layer.borderWidth = 1.0
            loginButton.layer.cornerRadius = 4
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.start(pastelPoint: .left)
        loginButton.end(pastelPoint: .right)
        loginButton.setColors(gradient: PastelGradient.nightFade)
        
        let pastelView = view as! PastelView
        pastelView.start(pastelPoint: .bottomLeft)
        pastelView.end(pastelPoint: .topRight)
        pastelView.animationDuration(3)
        
        pastelView.setColors([UIColor(red: 156/255, green: 39/255, blue: 176/255, alpha: 1.0),
                              UIColor(red: 255/255, green: 64/255, blue: 129/255, alpha: 1.0),
                              UIColor(red: 123/255, green: 31/255, blue: 162/255, alpha: 1.0),
                              UIColor(red: 32/255, green: 76/255, blue: 255/255, alpha: 1.0),
                              UIColor(red: 32/255, green: 158/255, blue: 255/255, alpha: 1.0),
                              UIColor(red: 90/255, green: 120/255, blue: 127/255, alpha: 1.0),
                              UIColor(red: 58/255, green: 255/255, blue: 217/255, alpha: 1.0)])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

