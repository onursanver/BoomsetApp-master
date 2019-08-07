//
//  LoginViewController.swift
//  BoomsetApp
//
//  Created by Onur Sanver on 7.08.2019.
//  Copyright © 2019 Onur Sanver. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextfield: UITextField!
    
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!{
        didSet{
        self.loginButton.layer.cornerRadius = 8
        }
    } 
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextfield.text = "testaccount@boomset.com"
        passwordTextfield.text = "Boomsettest123"
}
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    //MARK:Login Button
    @IBAction func loginButton(_ sender: Any) {
        self.view.backgroundColor = .yellow
         guard let userName = usernameTextfield.text?.lowercased() , let password = passwordTextfield.text , userName.count > 0 , password.count > 0 else {
            print("Eksik veri girildi.")
            return }
        
        let params : [String: Any] = ["username": userName , "password" : password]
        
        ApiService.shared.loginWithParams(params: params) {(authModel) in
          guard let authM = authModel else {
            print("Api Model gelmedi")
             self.view.backgroundColor = .red
            return }
            print("nbu isis yapacak : " , authM)
            self.view.backgroundColor = .green
            self.showViewController()
        }
        
    }
    func showViewController(){
        let groupViewController = GroupListViewController()
          self.navigationController?.pushViewController(groupViewController, animated: false)
    }
}
