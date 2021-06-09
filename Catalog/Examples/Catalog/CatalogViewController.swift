//
//  CatalogViewController.swift
//
//  Created by Filip Gulan on 01/02/2019.
//  Copyright (c) 2019 Infinum. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class CatalogViewController: UIViewController {

    // MARK: - Public properties -

    var presenter: CatalogPresenterInterface!
    
    // MARK: - Private properties -
    
    private lazy var _tableView: UITableView = _createTableView()
    
    private lazy var _tableDataSource: TableDataSourceDelegate = {
        return TableDataSourceDelegate(tableView: _tableView)
    }()

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        _setupUI()
        _configure()
    }
	
}

// MARK: - Extensions -

extension CatalogViewController: CatalogViewInterface {
}

private extension CatalogViewController {
    
    func _setupUI() {
        title = "Catalog"
    }
    
    func _configure() {
        _tableView.registerClass(cellOfType: CatalogItemTableViewCell.self)
        _tableDataSource.sections = presenter.sections()
    }
    
    func _createTableView() -> UITableView {
        let tableView = UITableView(frame: .zero, style: .grouped)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.pinToSuperview()
        
        return tableView
    }
    
}
