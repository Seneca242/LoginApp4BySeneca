//
//  ImageViewViewController.swift
//  LoginApp4BySeneca
//
//  Created by Дмитрий Дмитрий on 16.02.2022.
//

import UIKit

class ImageViewViewController: UIViewController {

    @IBOutlet var Image: UIImageView! {
        didSet {
            viewWillLayoutSubviews()
        }
    }
    
    var person: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Image.image = UIImage(named: person.person?.personPhoto ?? "")
        
    }
    override func viewWillLayoutSubviews() {
        Image.layer.cornerRadius = Image.frame.width / 2
    }
}
