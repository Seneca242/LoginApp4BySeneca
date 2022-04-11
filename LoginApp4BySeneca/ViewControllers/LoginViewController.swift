//
//  LoginViewController.swift
//  LoginApp4BySeneca
//
//  Created by Дмитрий Дмитрий on 16.02.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    let personInfo = User.getUserInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginButton() {
        if userNameTF.text != personInfo.userName || passwordTF.text != personInfo.password {
          showAlert(
            title: "Wrong User Name or Password",
            message: "Enter correct User Name and Password"
          )
            return
        }
    }
    
    @IBAction func userInfoForgotten(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(
            title: "Ooops",
            message: "Yr User Name is \(personInfo.userName)")
        : showAlert(
            title: "Ooops",
            message: "Yr Password is \(personInfo.password)")
    }
    
    @IBAction func unwindSegue(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarVC = segue.destination as? UITabBarController else { return }
        guard let allOtherVC = tabBarVC.viewControllers else { return }
        
        for viewController in allOtherVC {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.person = personInfo
            } else if let navigationVC = viewController as? UINavigationController {
                guard let userVC = navigationVC.topViewController as? UserInfoViewController else { return }
                userVC.person = personInfo
            }
        }
    }

    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(
            title: "Ok",
            style: .default) { _ in
                self.userNameTF.text = ""
                self.passwordTF.text = ""
            }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else {
            loginButton()
            performSegue(withIdentifier: "showWelcomeVC", sender: nil)
        }
        return true
    }
}
