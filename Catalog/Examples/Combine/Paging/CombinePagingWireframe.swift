//
//  CombinePagingWireframe.swift
//  Catalog
//
//  Created by Zvonimir Medak on 02.11.2021..
//  Copyright (c) 2021 Infinum. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

@available(iOS 13, *)
final class CombinePagingWireframe: BaseWireframe, CombinePagingWireframeInterface {

    // MARK: - Private properties -

    private let storyboard = UIStoryboard(name: "CombinePaging", bundle: nil)

    // MARK: - Module setup -

    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: CombinePagingViewController.self)
        super.init(viewController: moduleViewController)

        let interactor = CombinePagingInteractor()
        let presenter = CombinePagingPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}
