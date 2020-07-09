//
//  FactsService.swift
//  FactBook
//
//  Created by Sourabh Nag on 09/07/20.
//  Copyright © 2020 Sourabh Nag. All rights reserved.
//

import Foundation

protocol FactsServiceProtocol:class {
    func fetchFacts(_ completion: @escaping((Result<FactsInfo,ErrorResult>) -> Void))
}

final class FactsService: RequestHandler, FactsServiceProtocol {
    
    static let shared = FactsService()
    var task:URLSessionTask?
    
    /// This will convert the generic type to our desired model type FactInfo. This service will be utilized by our viewModel to fetch the facts.
    func fetchFacts(_ completion: @escaping ((Result<FactsInfo, ErrorResult>) -> Void)) {
        self.cancel()
        self.task = RequestService().loadData(urlString: Endpoint.facts(), encoding: String.Encoding.isoLatin1, completion: self.networkResult(completion: completion))
    }
    
    func cancel() {
        if let task = self.task {
            task.cancel()
        }
        task = nil
    }
}
