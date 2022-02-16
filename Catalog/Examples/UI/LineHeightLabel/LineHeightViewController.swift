//
//  LineHeightViewController.swift
//  Catalog
//
//  Created by Damjan Dimovski on 16.2.22.
//  Copyright (c) 2022 Infinum. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class LineHeightViewController: UIViewController {

    // MARK: - Public properties -

    var presenter: LineHeightPresenterInterface!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

// MARK: - Extensions -

extension LineHeightViewController: LineHeightViewInterface {
}

extension LineHeightViewController: Catalogizable {

    static var title: String {
        return "Line Height"
    }

    static var viewController: UIViewController {
        return LineHeightWireframe().viewController
    }
}
