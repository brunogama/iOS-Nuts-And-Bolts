//
//  NetworkingJapxViewController.swift
//  Catalog
//
//  Created by Mate Masnov on 02/12/2019.
//  Copyright (c) 2019 Infinum. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class NetworkingJapxViewController: UIViewController {

    // MARK: - Public properties -
    
    var presenter: NetworkingJapxPresenterInterface!
    
    // MARK: - Private properties -
    
    @IBOutlet private weak var _emailTextField: UITextField!
    @IBOutlet private weak var _usernameTextField: UITextField!
    @IBOutlet private weak var _passwordTextField: UITextField!
    
    @IBOutlet private weak var _createUserButton: UIButton!
    @IBOutlet private weak var _getUserButton: UIButton!
    @IBOutlet private weak var _updateUserButton: UIButton!
    @IBOutlet private weak var _deleteUserButton: UIButton!
    
    @IBOutlet private weak var _scrollView: UIScrollView!
    @IBOutlet private weak var _bottomConstraint: NSLayoutConstraint!
    
    private let _bottomHeight: CGFloat = 20
    
    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView(with: .userDoesNotExist)
    }
	
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        _startObservingKeyboardEvents()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        _stopObservingKeyboardEvents()
    }
    
}

// MARK: - Extensions -

extension NetworkingJapxViewController: NetworkingJapxViewInterface {
    
    func updateView(with state: NetworkingJapx.State) {
        _createUserButton._setEnabledModifyingAlpha(state == .userDoesNotExist)
        _getUserButton._setEnabledModifyingAlpha(state == .userExists)
        _updateUserButton._setEnabledModifyingAlpha(state == .userExists)
        _deleteUserButton._setEnabledModifyingAlpha(state == .userExists)
    }

}

extension NetworkingJapxViewController: Catalogizable {
    
    static var title: String {
        return "Japx Networking"
    }
    
    static var viewController: UIViewController {
        return NetworkingJapxWireframe().viewController
    }
    
}

private extension UIButton {
    
    func _setEnabledModifyingAlpha(_ shouldEnable: Bool) {
        self.isEnabled = shouldEnable
        self.alpha = shouldEnable ? 1 : 0.3
    }
    
}

// MARK: - IBActions -

private extension NetworkingJapxViewController {
    
    @IBAction func _createUserActionHandler(_ sender: Any) {
        presenter.didPressCreate(with: _emailTextField.text, username: _usernameTextField.text, password: _passwordTextField.text)
    }
    
    @IBAction func _getUserActionHandler(_ sender: Any) {
        presenter.didPressGet()
    }
    
    @IBAction func _updateUserActionHandler(_ sender: Any) {
        presenter.didPressUpdate(email: _emailTextField.text, username: _usernameTextField.text)
    }
    
    @IBAction func _deleteUserActionHandler(_ sender: Any) {
        presenter.didPressDelete()
    }
    
}

// MARK: - Keyboard notifications -

private extension NetworkingJapxViewController {
    
    func _startObservingKeyboardEvents() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(_keyboardWillChangeFrame(notification:)),
            name: UIResponder.keyboardWillChangeFrameNotification,
            object: nil
        )
    }
    
    func _stopObservingKeyboardEvents() {
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillChangeFrameNotification,
            object: nil
        )
    }

    @objc
    func _keyboardWillChangeFrame(notification: NSNotification) {
        guard let userInfo = notification.userInfo else { return }
        guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        
        let keyboardHeight = keyboardSize.origin.y < view.frame.size.height ? keyboardSize.height : 0
        _bottomConstraint.constant = keyboardHeight + _bottomHeight
        
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
}
