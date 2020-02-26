//
//  NetworkingJapxInteractor.swift
//  Catalog
//
//  Created by Mate Masnov on 02/12/2019.
//  Copyright (c) 2019 Infinum. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation
import Alamofire
import Japx

final class NetworkingJapxInteractor {
    
    private let _service: APIServiceable
    private let _sessionManager: SessionManager
    
    init(service: APIServiceable = APIService.instance, sessionManager: SessionManager = .default) {
        self._service = service
        self._sessionManager = sessionManager
    }
}

// MARK: - Extensions -

extension NetworkingJapxInteractor: NetworkingJapxInteractorInterface {
    
    func createUser(email: String, username: String, password: String, passwordConfirmation: String, completion: @escaping (AFResult<PokedexUser>) -> Void) -> DataRequest {
        let router = PokedexRouter.createUser(
            email: email,
            username: username,
            password: password,
            passwordConfirmation: passwordConfirmation
        )
        return _service.requestJSONAPI(
            PokedexUser.self,
            keyPath: "data",
            router: router,
            session: _sessionManager.session,
            completion: completion
        )
    }
    
    func getUser(id: String, completion: @escaping (AFResult<PokedexUser>) -> Void) -> DataRequest {
        return _service.requestJSONAPI(
            PokedexUser.self,
            keyPath: "data",
            router: PokedexRouter.getUser(id: id),
            session: _sessionManager.session,
            completion: completion
        )
    }
    
    func updateUser(
        id: String,
        email: String?,
        username: String?,
        completion: @escaping (AFResult<PokedexUser>) -> Void
    ) -> DataRequest {
        let router = PokedexRouter.updateUser(id: id, email: email, username: username)
        return _service.requestJSONAPI(
            PokedexUser.self,
            keyPath: "data",
            router: router,
            session: _sessionManager.session,
            completion: completion
        )
    }
    
    func deleteUser(id: String, completion: @escaping (AFResult<Void>) -> Void) -> DataRequest {
        let router = PokedexRouter.deleteUser(id: id)
        return _service.requestCompletion(
            router: router,
            session: _sessionManager.session,
            completion: completion
        )
    }
    
    func setAdapter(_ adapter: PokedexTokenAdapter) {
        _sessionManager.authorizationAdapter = adapter
    }
}
