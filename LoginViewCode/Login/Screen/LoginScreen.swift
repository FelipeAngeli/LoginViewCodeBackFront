//
//  LoginScreen.swift
//  LoginViewCode
//
//  Created by Felipe Angeli on 04/12/23.
//

import UIKit


protocol LoginScreenProtocol: AnyObject{
    func actionLoginButton()
    func actionRegisterButton()
}

class LoginScreen: UIView {

   private weak var delegate: LoginScreenProtocol?
    
    func delegate(delegate: LoginScreenProtocol?){
        self.delegate = delegate
    }
    
    
   lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.text = "Login"
        return label
    }()
    
    lazy var logoAppImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logo_whats")
        image.tintColor = .green
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocapitalizationType = .none
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress
        tf.placeholder = "Digite seu Email:"
        tf.textColor = .darkGray
        return tf
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocapitalizationType = .none
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.placeholder = "Digite sua Senha:"
        tf.isSecureTextEntry = true
        tf.textColor = .darkGray
        return tf
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Logar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = UIColor(red: 3/255, green: 58/255, blue: 51/255, alpha: 1.0)
        button.addTarget(self, action: #selector(self.tappedLoginButton), for: .touchUpInside)
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Não tem conta? Cadastre-se", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
      //  self.configButtonEnable(false) //validacao
//        self.configBackground()
//        self.configSuperView()
//        // ---- usando snapkit
//        self.configLoginLablConstraint()
//        self.configLogoAppImageViewConstraint()
//        self.configEmailTextFieldConstraint()
//        self.configPasswordTextFieldConstraint()
//        self.configLoginButtonConstraint()
//        self.configRegisterButtonConstraint()
        //--------------------
//        self.setUpConstrainst()
        self.configBackground() // cor de fundo
               self.configSuperView() // elementos add
               //------------------------------
               self.configLoginLabelConstraint() // constraints SNP
        
            //   self.setUpConstrainst()// constraints nativo
        
             self.configLogoAppImageViewConstraint()               
            self.configEmailTextFieldConstraint()
               self.configPasswordTextFieldConstraint()
               self.configLoginButtonConstraint()
            self.configRegisterButtonConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configBackground(){
        self.backgroundColor = UIColor(red: 24/255, green: 117/255, blue: 104/255, alpha: 1.0)
    }
    
    private func configSuperView(){
        self.addSubview(self.loginLabel)
        self.addSubview(self.logoAppImageView)
        self.addSubview(self.emailTextField)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.loginButton)
        self.addSubview(self.registerButton)
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate){
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }
    
    @objc private func tappedLoginButton(){
        self.delegate?.actionLoginButton()
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
    
    private func configButtonEnable(_ enable:Bool){
        if enable{
            self.loginButton.setTitleColor(.white, for: .normal)
            self.loginButton.isEnabled = true
        } else {
            self.loginButton.setTitleColor(.lightGray, for: .normal)
            self.loginButton.isEnabled = false
        }
    }
    
    //fim da validacao

    
    //constant
    //offset = valor positivo
    //inset = valor negativo
    
    // modo snapkit
    
    func configLoginLabelConstraint(){
           self.loginLabel.snp.makeConstraints { ( make) in
               make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20)
               make.centerX.equalToSuperview()
           }
       }
       func configLogoAppImageViewConstraint(){
           self.logoAppImageView.snp.makeConstraints { (make) in
               make.top.equalTo(self.loginLabel.snp.bottom).offset(20)
               make.centerX.equalToSuperview()
               make.leading.equalToSuperview().offset(60)
               make.trailing.equalToSuperview().inset(60)
               make.height.equalTo(200)
           }
       }
       
       func configEmailTextFieldConstraint() {
           self.emailTextField.snp.makeConstraints { (make) in
               make.top.equalTo(self.logoAppImageView.snp.bottom).offset(20)
               make.centerX.equalToSuperview()
               make.leading.equalToSuperview().offset(20)
               make.trailing.equalToSuperview().inset(20)
               make.height.equalTo(45)
           }
       }
       
       func configPasswordTextFieldConstraint(){
           self.passwordTextField.snp.makeConstraints { (make) in
               make.top.equalTo(self.emailTextField.snp.bottom).offset(15)
               make.centerX.equalToSuperview()
               make.leading.equalTo(self.emailTextField)
               make.trailing.equalTo(self.emailTextField)
               make.height.equalTo(emailTextField)
               
           }
       }
       
       func configLoginButtonConstraint(){
           self.loginButton.snp.makeConstraints{ (make) in
               make.top.equalTo(self.passwordTextField.snp.bottom).offset(20)
               make.centerX.equalToSuperview()
               make.leading.equalTo(self.passwordTextField)
               make.trailing.equalTo(self.passwordTextField)
               make.height.equalTo(passwordTextField)
           }
       }
       func configRegisterButtonConstraint(){
           self.registerButton.snp.makeConstraints{ (make) in
               make.top.equalTo(self.loginButton.snp.bottom).offset(15)
               make.centerX.equalToSuperview()
               make.leading.equalTo(self.loginButton)
               make.trailing.equalTo(self.loginButton)
               make.height.equalTo(loginButton)
           }
       }
    
    
    
    //modo nativo
//    private func setUpConstrainst(){
//        NSLayoutConstraint.activate([
//            self.loginLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
//            self.loginLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            
//            self.logoAppImageView.topAnchor.constraint(equalTo: self.loginLabel.bottomAnchor, constant: 20),
//            self.logoAppImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
//            self.logoAppImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
//            self.logoAppImageView.heightAnchor.constraint(equalToConstant: 200),
//       
//            self.emailTextField.topAnchor.constraint(equalTo: self.logoAppImageView.bottomAnchor, constant: 20),
//            self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
//            self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
//            self.emailTextField.heightAnchor.constraint(equalToConstant: 45),
//            
//            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 15),
//            self.passwordTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
//            self.passwordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
//            self.passwordTextField.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
//            
//            self.loginButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 15),
//            self.loginButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
//            self.loginButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
//            self.loginButton.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
//            
//            self.registerButton.topAnchor.constraint(equalTo: self.loginButton.bottomAnchor, constant: 15),
//            self.registerButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
//            self.registerButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
//            self.registerButton.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
//        ])
//    }


}
