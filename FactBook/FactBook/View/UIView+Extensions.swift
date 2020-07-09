//
//  UIView+Extensions.swift
//  FactBook
//
//  Created by Sourabh Nag on 09/07/20.
//  Copyright © 2020 Sourabh Nag. All rights reserved.
//

import Foundation
import UIKit

class ContainerView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
    }
    
}

extension UIView {
    
    func attachErrorView() -> ErrorView {
        let errorView = ErrorView(frame: .zero)
        errorView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(errorView)
        errorView.topAnchor.constraint(equalTo: self.topAnchor, constant:0).isActive = true
        errorView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant:0).isActive = true
        errorView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant:0).isActive = true
        errorView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant:0).isActive = true
        self.layoutIfNeeded()
        return errorView
    }
    
    func attachSpinner() -> UIActivityIndicatorView {
        let spinner = UIActivityIndicatorView(style: .gray)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        self.addSubview(spinner)

        spinner.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        return spinner
    }
    
}
