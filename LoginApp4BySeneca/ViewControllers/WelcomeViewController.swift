//
//  WelcomeViewController.swift
//  LoginApp4BySeneca
//
//  Created by Дмитрий Дмитрий on 16.02.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    
    var person: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(person.userName)!"
        title = "Welcome page"
    }
    

}
