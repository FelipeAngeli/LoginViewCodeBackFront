//
//  RegisterScreen.swift
//  LoginViewCode
//
//  Created by Felipe Angeli on 04/12/23.
//

import UIKit
import SnapKit

protocol RegisterScreenProtocol: AnyObject{
    func actionBackButton()
    func actionRegisterButton()
}

class RegisterScreen: UIView {
    
    weak private var delegate: RegisterScreenProtocol?
    
    func delegate(delegate:RegisterScreenProtocol?){
        self.delegate = delegate
    }
    
    
    lazy var backButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "back"), for: .normal)
        button.addTarget(self, action: #selector(self.tappedBackButton), for: .touchUpInside)
        
        return button
    }()
    
    lazy var imageAddUser:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "usuario")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress
        tf.placeholder = "Digite seu email"
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.textColor = .darkGray
        return tf
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.placeholder = "Digite sua senha"
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.isSecureTextEntry = true
        tf.textColor = .darkGray
        return tf
    }()
    
    lazy var registerButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = UIColor(red: 3/255, green: 58/255, blue: 51/255, alpha: 1.0)
        button.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)
        return button
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configButtonEnable(false) //validacao
        self.configBackGround()
        //--------------------
//       self.configImageAddUserConstraint()
//        self.configBackButtonConstraint()
//        self.configEmailTextFieldConstraint()
//        self.configPasswordTextFieldConstraint()
//       self.configRegisterButtonConstraint()
        //----------------------
        self.configSuperView()
        self.setupConstraint()
    }
    
    
    private func configSuperView() {
        self.addSubview(self.imageAddUser)
        self.addSubview(self.backButton)
        self.addSubview(self.emailTextField)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.registerButton)
    }
    
    
    private func configBackGround(){
        self.backgroundColor = UIColor(red: 24/255, green: 117/255, blue: 104/255, alpha: 1.0)
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate){
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }
    
    @objc private func tappedBackButton(){
        self.delegate?.actionBackButton()
    }

    
    @objc private func tappedRegisterButton(){
        self.delegate?.actionRegisterButton()
    }
    
    //validacao de campos
    public func validaTextFields(){
        let email: String = self.emailTextField.text ?? ""
        let password: String = self.passwordTextField.text ?? ""
        
        if !email.isEmpty && !password.isEmpty {
            self.configButtonEnable(true)
        } else {
            self.configButtonEnable(false)
        }
    }
    
    //get para infos da login
    public func getEmail() -> String{
        return self.emailTextField.text ?? ""
    }
    
    public func getPassword() -> String{
        return self.passwordTextField.text ?? ""
    }
    
    
    
    private func configButtonEnable(_ enable:Bool){
        if enable{
            self.registerButton.setTitleColor(.white, for: .normal)
            self.registerButton.isEnabled = true
        } else {
            self.registerButton.setTitleColor(.lightGray, for: .normal)
            self.registerButton.isEnabled = false
        }
    }
    
    //fim da validacao
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraint(){
        NSLayoutConstraint.activate([
            
            self.imageAddUser.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.imageAddUser.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.imageAddUser.widthAnchor.constraint(equalToConstant: 150),
            self.imageAddUser.heightAnchor.constraint(equalToConstant: 150),
            
            
            self.backButton.topAnchor.constraint(equalTo: self.imageAddUser.topAnchor),
            self.backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            self.emailTextField.topAnchor.constraint(equalTo: self.imageAddUser.bottomAnchor, constant: 10),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 45),
            
            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 15),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.passwordTextField.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
            
            self.registerButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 15),
            self.registerButton.leadingAnchor.constraint(equalTo: self.passwordTextField.leadingAnchor),
            self.registerButton.trailingAnchor.constraint(equalTo: self.passwordTextField.trailingAnchor),
            self.registerButton.heightAnchor.constraint(equalTo: self.passwordTextField.heightAnchor),
            
        ])
    }
    
    // MARK: - SnapKit


//    func configImageAddUserConstraint() {
//        self.imageAddUser.snp.makeConstraints { (make) in
//            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20)
//            make.centerX.equalToSuperview()
//            make.height.width.equalTo(150)
//        }
//    }
//
//    func configBackButtonConstraint() {
//            self.backButton.snp.makeConstraints { (make) in
//                make.top.equalTo(self.imageAddUser.snp.top)
//                make.leading.equalToSuperview().offset(20)
//              make.height.width.equalTo(36)
//            }
//        }
//
//        func configEmailTextFieldConstraint() {
//            self.emailTextField.snp.makeConstraints { (make) in
//                make.top.equalTo(self.imageAddUser.snp.bottom).offset(10)
//                make.centerX.equalToSuperview()
//                make.leading.equalToSuperview().offset(20)
//                make.trailing.equalToSuperview().inset(20)
//                make.height.equalTo(45)
//            }
//        }
//
//        func configPasswordTextFieldConstraint() {
//            self.passwordTextField.snp.makeConstraints { (make) in
//                make.top.equalTo(self.emailTextField.snp.bottom).offset(15)
//                make.leading.equalTo(self.emailTextField.snp.leading)
//                make.trailing.equalTo(self.emailTextField.snp.trailing)
//                make.height.equalTo(self.emailTextField.snp.height)
//            }
//        }
//
//        func configRegisterButtonConstraint() {
//            self.registerButton.snp.makeConstraints { (make) in
//                make.top.equalTo(self.passwordTextField.snp.bottom).offset(15)
//                make.leading.equalTo(self.passwordTextField.snp.leading)
//                make.trailing.equalTo(self.passwordTextField.snp.trailing)
//                make.height.equalTo(self.passwordTextField.snp.height)
//            }
//        }

    
}


