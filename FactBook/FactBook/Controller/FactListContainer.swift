//
//  FactListContainer.swift
//  FactBook
//
//  Created by Sourabh Nag on 09/07/20.
//  Copyright © 2020 Sourabh Nag. All rights reserved.
//

import Foundation
import UIKit

class FactListContainer: UIView {
    
    private var dataSource: FactsDataSource?
    private var refreshControl:UIRefreshControl?
    
    override init(frame: CGRect) {
        self.dataSource = nil
        super.init(frame: frame)
        self.constraintsInit()
    }
    
    required init?(coder: NSCoder) {
        self.dataSource = nil
        super.init(coder: coder)
        self.constraintsInit()
    }
    
    init(dataSource: FactsDataSource,delegate: FactsDelegate, refreshControl:UIRefreshControl) {
        self.dataSource = dataSource
        super.init(frame: .zero)
        
        // Initial view setUp
        self.backgroundColor = .groupTableViewBackground
        self.constraintsInit()
        self.tableView.refreshControl = refreshControl
        self.tableView.dataSource = dataSource
        self.tableView.delegate = delegate
    }
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .groupTableViewBackground
        tableView.separatorStyle = .none
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        tableView.layer.cornerRadius = Constants.Theme.Layer.cornerRadius
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(FactTableViewCell.self, forCellReuseIdentifier: FactTableViewCell.reuseIdentifier)
        return tableView
    }()
    
    private func constraintsInit() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8).isActive = true
        tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}
