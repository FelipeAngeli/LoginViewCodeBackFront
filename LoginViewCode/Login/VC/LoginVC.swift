//
//  LoginVC.swift
//  LoginViewCode
//
//  Created by Felipe Angeli on 04/12/23.
//

import UIKit
import Firebase

class LoginVC: UIViewController {
    
    var auth: Auth?
    var loginScreen: LoginScreen?
    var alert:Alert?
    
    override func loadView() {
        self.loginScreen = LoginScreen()
        self.view = self.loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginScreen?.delegate(delegate: self)
        self.loginScreen?.configTextFieldDelegate(delegate: self)
        self.auth = Auth.auth()
        self.alert = Alert(controller: self)
    }
    
   
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }


}

extension LoginVC:LoginScreenProtocol{
    func actionLoginButton() {
        guard let login = self.loginScreen else {return}
        
        self.auth?.signIn(withEmail: login.getEmail(), password: login.getPassword(), completion: {(usuario, error) in
            if error != nil{
                self.alert?.getAlert(titulo: "Atenção", mensagem: "Dados incorretos, verifique e tente novamente!!")
            } else {
                if usuario == nil{
                    self.alert?.getAlert(titulo: "Atenção", mensagem: "Tivemos um problema inesperado, tente novamente mais tarde")
                } else {
                    self.alert?.getAlert(titulo: "Parabéns", mensagem: "Usuario registrado com sucesso!!")
                }
            }
            
        })
    }
    
    func actionRegisterButton() {
        let vc:RegisterVC = RegisterVC()
        self.navigationController?.pushViewController(vc, animated: true)
        print("BOTAO REGISTER!!!")
    }
    
    
}

extension LoginVC:UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.loginScreen?.validaTextFields()
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn")
        textField.resignFirstResponder()
        return true
    }
}

