//
//  Result.swift
//  FactBook
//
//  Created by Sourabh Nag on 09/07/20.
//  Copyright © 2020 Sourabh Nag. All rights reserved.
//

///This will be our generic result type. We'll passing it around to make our code more diverse and readable
enum Result<T,E:Error> {
    case success(T)
    case failure(E)
}
