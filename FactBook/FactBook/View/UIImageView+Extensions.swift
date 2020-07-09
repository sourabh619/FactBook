//
//  UIImageView+Extensions.swift
//  FactBook
//
//  Created by Sourabh Nag on 09/07/20.
//  Copyright © 2020 Sourabh Nag. All rights reserved.
//

import Foundation
import UIKit

class BasicImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(image: UIImage?) {
        super.init(image: image)
        self.contentMode = .scaleAspectFill
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = Constants.Theme.Layer.cornerRadius
        self.clipsToBounds = true
    }
    
}
