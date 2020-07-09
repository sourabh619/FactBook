//
//  String+Extensions.swift
//  FactBook
//
//  Created by Sourabh Nag on 09/07/20.
//  Copyright © 2020 Sourabh Nag. All rights reserved.
//

import Foundation

protocol Localizable {
    var tableName: String { get }
    var localized: String { get }
}

extension Localizable where Self: RawRepresentable, Self.RawValue == String {
    var localized: String {
        return rawValue.localized(tableName: tableName)
    }
}

enum LocalizableStrings: String, Localizable {
    
    case urlFormat = "URL format is invalid"
    case network = "An error occured during request :"
    case parser = "Error while parsing json data"
    case missingService = "Missing service"
    
    var tableName: String {
        return "Localizable"
    }
}

extension String {
    func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, value: "**\(self)**", comment: "")
    }
}
