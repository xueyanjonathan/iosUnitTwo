//
//  ViewController.swift
//  Login Lab
//
//  Created by Jonathan on 4/5/19.
//  Copyright © 2019 Jonathan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var forgetUsername: UIButton!
    @IBOutlet weak var forgetPassword: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? UIButton else {return}
        // Cast the sender as a UIButton since the sender in prepare for segue is set up as Any
        
        if sender == forgetPassword {
            segue.destination.navigationItem.title = "Forgot Password"
        } else if sender == forgetUsername {
            segue.destination.navigationItem.title = "Forgot Name"
        } else {
            segue.destination.navigationItem.title = username.text
        }
    }

    @IBAction func forgetUsernameAction(_ sender: UIButton) {
        performSegue(withIdentifier: "toLanding", sender: forgetUsername)
        // Trigger the toLanding segue
    }
    
    @IBAction func forgetPasswordAction(_ sender: UIButton) {
        performSegue(withIdentifier: "toLanding", sender: forgetPassword)
        // Trigger the toLanding segue
    }
}

