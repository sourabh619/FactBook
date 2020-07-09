//
//  Constants.swift
//  FactBook
//
//  Created by Sourabh Nag on 09/07/20.
//  Copyright © 2020 Sourabh Nag. All rights reserved.
//

import UIKit
import Foundation

struct Constants {
    
    /// This structure will contain all the theme constants and will be used everywhere in the application
    struct Theme {
        
        struct Color {
            static let navigationBar = UIColor(red: 241/255, green: 140/255, blue: 140/255, alpha: 1)
            static let lightTextColor = UIColor.darkGray
            static let darkColor = UIColor.black
        }
        
        struct Layer {
            static let cornerRadius:CGFloat = 10
        }
        
        struct Image {
            static let placeholder = UIImage(named: "picture")
        }
        
        struct Font {
            static let small = UIFont.systemFont(ofSize: 14)
            static let smallBold = UIFont.boldSystemFont(ofSize: 14)
            static let medium = UIFont.systemFont(ofSize: 20)
            static let mediumBold = UIFont.boldSystemFont(ofSize: 20)
        }
        
    }
    
}
