//
//  ErrorResult.swift
//  FactBook
//
//  Created by Sourabh Nag on 09/07/20.
//  Copyright © 2020 Sourabh Nag. All rights reserved.
//

/// This will be our custom error result type 
enum ErrorResult: Error {
    case network(string:String)
    case parser(string:String)
    case custom(string:String)
}
