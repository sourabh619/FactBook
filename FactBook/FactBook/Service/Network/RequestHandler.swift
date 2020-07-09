//
//  RequestHandler.swift
//  FactBook
//
//  Created by Sourabh Nag on 09/07/20.
//  Copyright © 2020 Sourabh Nag. All rights reserved.
//

import Foundation

class RequestHandler {
    
    /// This function will handle the response provided by the Request Service class and parse it to get the desired models as a form of a generic type. We'll define the generic type in our viewModel class
    func networkResult<T: Parceable>(completion: @escaping ((Result<T, ErrorResult>) -> Void)) ->
        ((Result<Data, ErrorResult>) -> Void) {
            return { dataResult in
                DispatchQueue.global(qos: .background).async(execute: {
                    switch dataResult {
                    case .success(let data) :
                        ParserHelper.parse(data: data, completion: completion)
                        break
                    case .failure(let error) :
                        completion(.failure(.network(string: LocalizableStrings.networkErrorExplanation.localized + error.localizedDescription)))
                        break
                    }
                })
            }
    }
    
}
