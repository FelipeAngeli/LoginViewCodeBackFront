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
    var alert:Alert?
    
    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.view = self.registerScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerScreen?.configTextFieldDelegate(delegate: self)
        self.registerScreen?.delegate(delegate: self)
        self.auth = Auth.auth()
        self.alert = Alert(controller: self)
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
        
        guard let register = self.registerScreen else {return}
        
        self.auth?.createUser(withEmail: register.getEmail(), password: register.getPassword(), completion: { (result, error) in
            if error != nil {
                self.alert?.getAlert(titulo: "Atenção", mensagem: "Error ao cadastrar, verifique os dados e tente novamente")
            } else {
                self.alert?.getAlert(titulo: "Parabéns", mensagem: "Usuario cadastrado com sucesso", completion: {
                    self.navigationController?.popViewController(animated: true)
                })

            }
        })
    }
    
    
}
