//
//  FactsViewController.swift
//  FactBook
//
//  Created by Sourabh Nag on 09/07/20.
//  Copyright © 2020 Sourabh Nag. All rights reserved.
//

import UIKit

class FactsViewController: UIViewController {
    
    private let dataSource = FactsDataSource()
    private let delegate = FactsDelegate()
    private var containerView: FactListContainer!
    private let refreshControl = UIRefreshControl()
    
    lazy private var viewModel : FactsViewModel = {
        let viewModel = FactsViewModel(dataSource: dataSource, delegate: delegate)
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUp()
    }
    
    /// Set Up background view, container view containing the list of facts and viewModel listeners
    private func setUp() {
        view.backgroundColor = .white
        self.setUpContainerView()
        self.setUpListeners()
        self.viewModel.fetchFacts()
    }
    
    @objc private func loadData(_ sender: Any) {
        self.viewModel.fetchFacts()
    }
    
    private func setUpContainerView() {
        refreshControl.addTarget(self, action: #selector(loadData(_:)), for: .valueChanged)
        containerView = FactListContainer(dataSource: dataSource,delegate: delegate,refreshControl: refreshControl)
        view.addSubview(containerView)
        containerView.leadingAnchor.constraint(equalTo:self.view.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo:self.view.trailingAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo:self.view.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo:self.view.bottomAnchor).isActive = true
    }
    
    private func setUpListeners() {
        self.dataSource.data.addObserver(self) {[weak self] (factInfo) in
            DispatchQueue.main.async {
                self?.title = factInfo.first?.title ?? ""
                self?.refreshControl.endRefreshing()
                self?.containerView.reloadData()
            }
        }
        
        self.viewModel.onErrorHandling = { [weak self] error in
            DispatchQueue.main.async {
                self?.refreshControl.endRefreshing()
                AppHelper.shared.showAlert(on: self, retryAction: {[weak self] _ in
                    self?.viewModel.fetchFacts()
                })
            }
        }
    }
}
