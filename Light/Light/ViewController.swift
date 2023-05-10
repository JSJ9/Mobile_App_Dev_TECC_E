//
//  ViewController.swift
//  Light
//
//  Created by JIMENEZ, JANINE on 4/19/23.
//

import UIKit

class ViewController: UIViewController {
    var lightOn = true
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    fileprivate func updateUI() {
        if lightOn {
            view.backgroundColor = .white
        } else {
            view.backgroundColor = .black
        }
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        lightOn.toggle()
        updateUI()
    }
}

