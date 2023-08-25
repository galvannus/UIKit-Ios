//
//  LoginViewController.swift
//  UIKit Ios
//
//  Created by Jorge Alejndro Marcial Galvan on 17/08/23.
//

import UIKit

class LoginViewController: UIViewController {
    private var stackView: UIStackView!
    private var logoImage: UIImageView!
    private var userTextfield: UITextField!
    private var passwordTextfield: UITextField!
    private var loginButton: UIButton!

    // MARK: - Properties

    weak var coordinator: Coordinator?
    weak var context: Context?
    var viewModel: LoginViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setUpView()
        setUpLayout()
    }

    // Configuración elementos UI
    private func setUpView() {
        logoImage = UIImageView(image: viewModel.getLogoImage())
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.contentMode = .scaleAspectFit

        userTextfield = UITextField()
        userTextfield.translatesAutoresizingMaskIntoConstraints = false
        userTextfield.placeholder = viewModel.getUserPlaceholder()
        userTextfield.autocorrectionType = .no
        userTextfield.textColor = .systemGreen
        userTextfield.layer.borderWidth = 1.0
        userTextfield.layer.borderColor = UIColor.systemPurple.cgColor
        userTextfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: userTextfield.frame.height))
        userTextfield.leftViewMode = .always

        passwordTextfield = UITextField()
        passwordTextfield.translatesAutoresizingMaskIntoConstraints = false
        passwordTextfield.placeholder = viewModel.getPasswordPlaceholder()
        passwordTextfield.autocorrectionType = .no
        passwordTextfield.textColor = .systemGreen
        passwordTextfield.layer.borderWidth = 1.0
        passwordTextfield.layer.borderColor = UIColor.systemPurple.cgColor
        passwordTextfield.isSecureTextEntry = true
        passwordTextfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: passwordTextfield.frame.height))
        passwordTextfield.leftViewMode = .always

        loginButton = UIButton(type: .system)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitle(viewModel.getTitleButton(), for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.backgroundColor = .systemPurple
        loginButton.addTarget(self, action: #selector(goMainView), for: .touchUpInside)

        // Se agregan los componentes a StacView
        stackView = UIStackView(arrangedSubviews: [logoImage, userTextfield, passwordTextfield, loginButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 24
    }

    private func setUpLayout() {
        view.addSubview(stackView)

        // Definir altura de los elementos
        [userTextfield, passwordTextfield, loginButton].forEach {
            // El elemento actual el heightAnchor = 50, se activa con isActive = true
            $0?.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }

        // Activar constraints
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.widthAnchor.constraint(equalToConstant: view.bounds.width - 40),
        ])
    }
    
    @objc func goMainView(){
        context?.initialize(coordinator: MainViewCoordinator(context: context!))
    }
}
