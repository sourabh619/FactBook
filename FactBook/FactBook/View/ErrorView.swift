//
//  NoInternetConnection.swift
//  FactBook
//
//  Created by Sourabh Nag on 09/07/20.
//  Copyright © 2020 Sourabh Nag. All rights reserved.
//

import Foundation
import UIKit

protocol ErrorViewDelegate: class {
    func refreshButtonAction()
}

class ErrorView: UIView {
    
    weak var delegate: ErrorViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        constraintsInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        constraintsInit()
    }
    
    let refreshButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(LocalizableStrings.retry.localized, for: .normal)
        button.setTitleColor(Constants.Theme.Color.navigationBar, for: .normal)
        button.addTarget(self, action: #selector(refreshFacts(_:)), for: .touchUpInside)
        return button
    }()
    
    let noInternetConnetionLabel: ThemeLabel = {
        let label = ThemeLabel()
        label.text = LocalizableStrings.somethingWentWrong.localized
        return label
    }()
    
    let parentView: UIView = {
        let view = UIView(frame: UIScreen.main.bounds)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func constraintsInit() {
        addSubview(parentView)
        let stackView = UIStackView(arrangedSubviews: [noInternetConnetionLabel,refreshButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        parentView.addSubview(stackView)
        
        parentView.topAnchor.constraint(equalTo: self.topAnchor, constant:0).isActive = true
        parentView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant:0).isActive = true
        parentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant:0).isActive = true
        parentView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant:0).isActive = true
        
        stackView.centerYAnchor.constraint(equalTo: parentView.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: parentView.centerXAnchor).isActive = true
        stackView.heightAnchor.constraint(equalTo: parentView.heightAnchor, multiplier: 0.1).isActive = true
        stackView.widthAnchor.constraint(equalTo: parentView.widthAnchor, multiplier: 1).isActive = true
    }
    
    @objc func refreshFacts(_ sender:UIButton) {
        delegate?.refreshButtonAction()
    }
}

