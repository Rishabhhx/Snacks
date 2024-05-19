//
//  SignInVC.swift
//  Snacks
//
//  Created by Rishabh Sharma on 25/03/24.
//

import UIKit

class SignInVC: UIViewController {
    
    // MARK: - Properties
    var emailText = ""
    var tempEmail = "abc@gmail.com"
    var passwordText = ""
    var tempPassword = "12345678"
    
    // MARK: - UI Elements
    lazy var signinLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.text = "Sign in"
        return label
    }()
    
    lazy var welcomeLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .thin)
        label.text = "Welcome to CineSnacks!"
        return label
    }()

    lazy var subLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .thin)
        label.text = "Sign in to satisfy your snack cravings."
        return label
    }()
    
    lazy var labelStack : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [welcomeLabel, subLabel])
        stackView.axis = .vertical
        stackView.spacing = 14
        stackView.alignment = .center
        return stackView
    }()
    
    lazy var emailLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .thin)
        label.text = "Email"
        return label
    }()
    
    lazy var passwordLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .thin)
        label.text = "Password"
        return label
    }()
    
    lazy var emailTextField : UITextField = {
        let textField = RoundBoardedRedTextField()
        textField.placeholder = "Enter your email"
        return textField
    }()
    
    lazy var passwordTextField : UITextField = {
        let textField = RoundBoardedRedTextField()
        textField.placeholder = "Enter your password"
        return textField
    }()
    
    lazy var passwordTextFieldView : UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 12
        view.layer.borderColor = UIColor.red.cgColor
        return view
    }()
    
    lazy var emailTextFieldView : UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 12
        view.layer.borderColor = UIColor.red.cgColor
        return view
    }()
    
    lazy var fieldStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailLabel,emailTextFieldView,passwordLabel,passwordTextFieldView])
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
    
    lazy var forgotButton : UIButton = {
        let button = UIButton(type: .system)
        let yourAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 14),
            .foregroundColor: UIColor.black,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        let attributeString = NSMutableAttributedString(
           string: "Forgot Password?",
           attributes: yourAttributes
        )
        button.setAttributedTitle(attributeString, for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    } ()
    
    lazy var signInButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign In", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.backgroundColor = UIColor(red: 218/255, green: 55/255, blue: 50/255, alpha: 1)
        return button
    }()
    
    lazy var continueLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.text = "Or continue with"
        return label
    }()
    
    lazy var lineView : UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    lazy var lineView2 : UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    lazy var continueStack : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [lineView2, continueLabel, lineView])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        return stackView
    }()
    
    lazy var googleButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "google"), for: .normal)
        return button
    }()
    
    lazy var appleButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "apple"), for: .normal)
        return button
    }()
    
    lazy var facebookButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "facebook"), for: .normal)
        return button
    }()
    
    lazy var buttonStack : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [googleButton, appleButton, facebookButton])
        stackView.axis = .horizontal
        stackView.spacing = 10
        return stackView
    }()
    
    lazy var dontHaveAccountLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.text = "Don’t have an account?"
        return label
    }()
    
    lazy var signUpButton : UIButton = {
        let button = UIButton(type: .system)
        let yourAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 14),
            .foregroundColor: UIColor.black,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        let attributeString = NSMutableAttributedString(
           string: "Sign Up",
           attributes: yourAttributes
        )
        button.setAttributedTitle(attributeString, for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    lazy var signUpStack : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [dontHaveAccountLabel, signUpButton])
        stackView.axis = .horizontal
        stackView.spacing = 6
        return stackView
    }()
    
    // MARK: - Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = true
        emailTextField.addTarget(self, action: #selector(emailTextFieldEditing), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(passwordTextFieldEditing), for: .editingChanged)
        signInButton.addTarget(self, action: #selector(siginButtonAction), for: .touchUpInside)
        setupView()
    }
    
    // MARK: - Actions
    @objc private func emailTextFieldEditing() {
        emailText = emailTextField.text ?? ""
    }
    
    @objc private func passwordTextFieldEditing() {
        passwordText = passwordTextField.text ?? ""
    }
    
    @objc private func siginButtonAction() {
        if emailText == tempEmail && passwordText == tempPassword {
            print("success")
        } else {
            print("failed")
        }
    }

    // MARK: - Private Functions
    private func setupView() {
        self.view.addSubview(signinLabel)
        self.view.addSubview(labelStack)
        self.view.addSubview(fieldStackView)
        self.passwordTextFieldView.addSubview(passwordTextField)
        self.emailTextFieldView.addSubview(emailTextField)
        self.view.addSubview(forgotButton)
        self.view.addSubview(signInButton)
        self.view.addSubview(continueStack)
        self.view.addSubview(buttonStack)
        self.view.addSubview(signUpStack)
        
        signinLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.centerX.equalToSuperview()
        }
        labelStack.snp.makeConstraints { make in
            make.top.equalTo(signinLabel.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }
        fieldStackView.snp.makeConstraints { make in
            make.top.equalTo(labelStack.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
        }
        passwordTextFieldView.snp.makeConstraints { make in
            make.height.equalTo(48)
        }
        emailTextFieldView.snp.makeConstraints { make in
            make.height.equalTo(48)
        }
        passwordTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview().inset(10)
        }
        emailTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview().inset(10)
        }
        forgotButton.snp.makeConstraints { make in
            make.top.equalTo(fieldStackView.snp.bottom).offset(20)
            make.trailing.equalTo(fieldStackView)
        }
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(forgotButton.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(48)
        }
        lineView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.width.equalTo(104)
        }
        lineView2.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.width.equalTo(104)
        }
        continueStack.snp.makeConstraints { make in
            make.top.equalTo(signInButton.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }
        buttonStack.snp.makeConstraints { make in
            make.top.equalTo(continueStack.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        signUpStack.snp.makeConstraints { make in
            make.top.equalTo(buttonStack.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        googleButton.snp.makeConstraints { make in
            make.height.width.equalTo(48)
        }
        appleButton.snp.makeConstraints { make in
            make.height.width.equalTo(48)
        }
        facebookButton.snp.makeConstraints { make in
            make.height.width.equalTo(48)
        }
    }
}
