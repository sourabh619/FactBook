//
//  ParcerHelper.swift
//  FactBook
//
//  Created by Sourabh Nag on 09/07/20.
//  Copyright © 2020 Sourabh Nag. All rights reserved.
//

import Foundation

protocol Parceable {
    static func parseObject(data:Data) -> Result<Self,ErrorResult>
}

final class ParserHelper {
    
    /// This function will take the data. Pass it onto the Codable object to parse the json and returns back the genric type as result type. Our object should conform to Parceable
    static func parse<Element: Parceable>(data: Data,completion: (Result<Element,ErrorResult>) -> ()) {
        switch Element.parseObject(data: data) {
        case .success(let newModel):
            completion(.success(newModel))
        case .failure(let error):
            completion(.failure(error))
        }
    }
    
}
