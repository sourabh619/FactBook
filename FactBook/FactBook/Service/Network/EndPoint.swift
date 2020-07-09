//
//  EndPoint.swift
//  FactBook
//
//  Created by Sourabh Nag on 09/07/20.
//  Copyright © 2020 Sourabh Nag. All rights reserved.
//

/// Host Names
enum Host: String {
    case development = "https://dl.dropboxusercontent.com/"
}

/// Selected Host
var selectedHost: Host = .development

/// End Points
enum Endpoint {
    static func facts() -> String {
        return "\(selectedHost.rawValue)s/2iodh4vg0eortkl/facts.json"
    }
}
