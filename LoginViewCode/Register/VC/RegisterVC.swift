//
//  RegisterVC.swift
//  LoginViewCode
//
//  Created by Felipe Angeli on 04/12/23.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {
    
    var registerScreen:RegisterScreen?
    
    var auth:Auth?
    
    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.view = self.registerScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerScreen?.configTextFieldDelegate(delegate: self)
        self.registerScreen?.delegate(delegate: self)
        self.auth = Auth.auth()
    }
    


}

extension RegisterVC: UITextFieldDelegate{
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        self.registerScreen?.validaTextFields()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


extension RegisterVC:RegisterScreenProtocol{
    func actionBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func actionRegisterButton() {
        print("register button")
        
        let email:String = self.registerScreen?.emailTextField.text ?? ""
        let password:String = self.registerScreen?.passwordTextField.text ?? ""
        
        self.auth?.createUser(withEmail: email, password: password, completion: { (result, error) in
            if error != nil {
                print("Error ao cadastrar!!")
            } else {
                print("Sucesso ao cadastrar!!")
            }
        })
    }
    
    
}
