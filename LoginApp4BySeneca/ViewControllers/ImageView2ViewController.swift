//
//  ImageView2ViewController.swift
//  LoginApp4BySeneca
//
//  Created by Дмитрий Дмитрий on 19.02.2022.
//

import UIKit

class ImageView2ViewController: UIViewController {

    @IBOutlet var Image: UIImageView!
    
    var person: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Image.image = UIImage(named: person.person?.personPhoto ?? "")
    }
}
