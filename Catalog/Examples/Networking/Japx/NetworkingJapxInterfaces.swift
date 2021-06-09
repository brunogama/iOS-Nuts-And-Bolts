//
//  NetworkingJapxInterfaces.swift
//  Catalog
//
//  Created by Mate Masnov on 02/12/2019.
//  Copyright (c) 2019 Infinum. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit
import Alamofire

enum NetworkingJapx {
    
    enum State {
        case userExists
        case userDoesNotExist
    }
    
}

protocol NetworkingJapxWireframeInterface: WireframeInterface, Progressable {
    func displayInfoAlert(with title: String?, message: String?)
    func displayInfoAlert(with title: String?, message: String?, completion: ((UIAlertAction) -> Void)?)
    func displayAlert(with title: String?, message: String?, actions: [UIAlertAction], style: UIAlertController.Style)
}

protocol NetworkingJapxViewInterface: ViewInterface, Progressable {
    func updateView(with state: NetworkingJapx.State)
}

protocol NetworkingJapxPresenterInterface: PresenterInterface {
    func didPressCreate(with email: String?, username: String?, password: String?)
    func didPressUpdate(email: String?, username: String?)
    func didPressGet()
    func didPressDelete()
}

protocol NetworkingJapxInteractorInterface: InteractorInterface {
    @discardableResult
    func createUser(
        email: String,
        username: String,
        password: String,
        passwordConfirmation: String,
        completion: @escaping (AFResult<PokedexUser>) -> Void
    ) -> DataRequest
    @discardableResult
    func getUser(id: String, completion: @escaping (AFResult<PokedexUser>) -> Void) -> DataRequest
    @discardableResult
    func updateUser(id: String, email: String?, username: String?, completion: @escaping (AFResult<PokedexUser>) -> Void) -> DataRequest
    @discardableResult
    func deleteUser(id: String, completion: @escaping (AFResult<Void>) -> Void) -> DataRequest
    func setAdapter(_ adapter: PokedexTokenAdapter)
}
