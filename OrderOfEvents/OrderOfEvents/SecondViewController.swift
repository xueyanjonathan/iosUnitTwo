//
//  SecondViewController.swift
//  OrderOfEvents
//
//  Created by Jonathan on 4/15/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var LabelSecondScreen: UILabel!
    
    var eventNumber: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let existingText = LabelSecondScreen.text {
            LabelSecondScreen.text = "\(existingText)\nEvent number\(eventNumber) was viewDidLoad"
            eventNumber += 1
            // Add statement to the label about a life cycle which just occured, print it with the corresponding event number.
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let existingText = LabelSecondScreen.text {
            LabelSecondScreen.text = "\(existingText)\nEvent number\(eventNumber) was viewWillAppear"
             eventNumber += 1
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let existingText = LabelSecondScreen.text {
            LabelSecondScreen.text = "\(existingText)\nEvent number\(eventNumber) was viewDidAppear"
            eventNumber += 1
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let existingText = LabelSecondScreen.text {
            LabelSecondScreen.text = "\(existingText)\nEvent number\(eventNumber) was viewWillDisappear"
            eventNumber += 1
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if let existingText = LabelSecondScreen.text {
            LabelSecondScreen.text = "\(existingText)\nEvent number\(eventNumber) was viewDidDisappear"
            eventNumber += 1
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
