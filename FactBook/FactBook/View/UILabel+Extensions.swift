//
//  UILabel+Extensions.swift
//  FactBook
//
//  Created by Sourabh Nag on 09/07/20.
//  Copyright © 2020 Sourabh Nag. All rights reserved.
//

import Foundation
import UIKit

class BasicLabel: UILabel {
    
    init() {
        super.init(frame: .zero)
        
        self.textColor = Constants.Theme.Color.darkColor
        
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            self.font = Constants.Theme.Font.smallBold
        case .pad:
            self.font = Constants.Theme.Font.mediumBold
        default:
            self.font = UIFont.preferredFont(forTextStyle: .body)
        }
        
        self.text = ""
        self.translatesAutoresizingMaskIntoConstraints = false
        self.lineBreakMode = .byWordWrapping
        self.numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

class ThemeLabel: BasicLabel {
    
    override init() {
        super.init()
        self.textColor = Constants.Theme.Color.lightTextColor
        
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            self.font = Constants.Theme.Font.small
        case .pad:
            self.font = Constants.Theme.Font.medium
        default:
            self.font = UIFont.preferredFont(forTextStyle: .body)
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
