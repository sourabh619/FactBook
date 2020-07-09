//
//  FactTableViewCell.swift
//  FactBook
//
//  Created by Sourabh Nag on 09/07/20.
//  Copyright © 2020 Sourabh Nag. All rights reserved.
//

import UIKit
import SDWebImage

class FactTableViewCell: UITableViewCell {

    static let reuseIdentifier: String = String(describing: self)
    
    private let titleLabel: BasicLabel = {
        let label = BasicLabel()
        return label
    }()
    
    private let containerView: ContainerView = {
        let view = ContainerView()
        return view
    }()
    
    private let parentView: ContainerView = {
        let view = ContainerView()
        return view
    }()
    
    private let profileImageView: BasicImageView = {
        let imageView = BasicImageView(image: UIImage())
        return imageView
    }()
    
    private let jobTitleDetailedLabel: ThemeLabel = {
        let label = ThemeLabel()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.commonInit()
        self.constraintInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
        self.constraintInit()
    }
    
    private func commonInit() {
        self.backgroundColor = .clear
        self.parentView.backgroundColor = UIColor.white
        self.parentView.layer.cornerRadius = Constants.Theme.Layer.cornerRadius
    }
    
    /// Images are expanded and contracted in a way that they look nice in the landscape view. On rotation if the cell if small height constraint will  be automatically neglected and inequality constraint will take presidence giving the view a nicer look. If the cell is larger the height constraint will take presidence
    private func constraintInit() {
        self.contentView.addSubview(parentView)
        self.parentView.addSubview(profileImageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(jobTitleDetailedLabel)
        self.contentView.addSubview(containerView)
        
        parentView.topAnchor.constraint(equalTo:self.contentView.topAnchor, constant:8).isActive = true
        parentView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:8).isActive = true
        parentView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-8).isActive = true
        parentView.bottomAnchor.constraint(equalTo:self.contentView.bottomAnchor, constant:-8).isActive = true
        
        profileImageView.topAnchor.constraint(equalTo:self.parentView.topAnchor, constant:8).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo:self.parentView.leadingAnchor, constant:8).isActive = true
        profileImageView.widthAnchor.constraint(equalTo: self.parentView.widthAnchor,multiplier: 0.12).isActive = true
        profileImageView.heightAnchor.constraint(equalTo: profileImageView.widthAnchor).isActive = true
        let inequalityConstraint = parentView.bottomAnchor.constraint(greaterThanOrEqualTo: profileImageView.bottomAnchor,constant: 8)
        inequalityConstraint.priority = UILayoutPriority.init(rawValue: 999)
        inequalityConstraint.isActive = true
        
        containerView.topAnchor.constraint(equalTo:self.parentView.topAnchor, constant:8).isActive = true
        containerView.leadingAnchor.constraint(equalTo:self.profileImageView.trailingAnchor, constant:8).isActive = true
        containerView.trailingAnchor.constraint(equalTo:self.parentView.trailingAnchor, constant:-8).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.parentView.bottomAnchor, constant: -8).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor,constant: 0).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
        
        jobTitleDetailedLabel.topAnchor.constraint(equalTo:self.titleLabel.bottomAnchor, constant: 8).isActive = true
        jobTitleDetailedLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor,constant: 0).isActive = true
        jobTitleDetailedLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
        jobTitleDetailedLabel.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: -8).isActive = true
        jobTitleDetailedLabel.setContentHuggingPriority(UILayoutPriority.init(rawValue: 249), for: .vertical)
    }

    func configure(with fact:Fact) {
        if let url = URL(string: fact.image ?? "") {
            self.profileImageView.sd_setImage(with: url, placeholderImage: Constants.Theme.Image.placeholder)
        }else {
            self.profileImageView.image = Constants.Theme.Image.placeholder
        }
        self.titleLabel.text = fact.title
        self.jobTitleDetailedLabel.text = fact.description
    }
    
}
