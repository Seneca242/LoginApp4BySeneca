//
//  UserInfoViewController.swift
//  LoginApp4BySeneca
//
//  Created by Дмитрий Дмитрий on 16.02.2022.
//

import UIKit

class UserInfoViewController: UIViewController {

    var person: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\(person.person?.name ?? "") \(person.person?.surName ?? "")"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let imageViewVC = segue.destination as? ImageViewViewController else { return }
        imageViewVC.person = person
        
        guard let imageView2VC = segue.destination as? ImageView2ViewController else { return }
        imageView2VC.person = person
    }

}
