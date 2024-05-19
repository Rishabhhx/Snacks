//
//  SignUpVC.swift
//  Snacks
//
//  Created by Rishabh Sharma on 27/03/24.
//

import UIKit

class SignUpVC: UIViewController {
    
    // MARK: - Properties
    
    
    // MARK: - UI Elements
    lazy var nameLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .thin)
        label.text = "Full name"
        return label
    }()
    
    lazy var nameTextField : UITextField = {
        let textField = UITextField()
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        textField.placeholder = "Enter your name"
        return textField
    }()
    
    lazy var emailLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .thin)
        label.text = "email"
        return label
    }()
    
    lazy var emailTextField : UITextField = {
        let textField = UITextField()
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        textField.placeholder = "Enter your email"
        return textField
    }()
    
    lazy var passwordLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .thin)
        label.text = "Password"
        return label
    }()
    
    lazy var passwordField : UITextField = {
        let textField = UITextField()
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        textField.placeholder = "Enter your password"
        return textField
    }()
    
    lazy var repasswordLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .thin)
        label.text = "Re-enter password"
        return label
    }()
    
    lazy var confirmPasswordField : UITextField = {
        let textField = UITextField()
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        textField.placeholder = "Confirm your password"
        return textField
    }()
    
    // MARK: - Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    // MARK: - Actions
    

    // MARK: - Private Functions
    private func setupView() {
        
    }
}
