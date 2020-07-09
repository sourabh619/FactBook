//
//  RequestService.swift
//  FactBook
//
//  Created by Sourabh Nag on 09/07/20.
//  Copyright © 2020 Sourabh Nag. All rights reserved.
//

import Foundation
import Reachability

class RequestService {
    
    /// This functions will actually communicate with the server to fetch the facts as Data. It'll return the result type with data as the success model
    func loadData(urlString: String, session: URLSession = URLSession(configuration: .default), encoding: String.Encoding, completion:@escaping(Result<Data,ErrorResult>) -> ()) -> URLSessionTask? {
        guard let url = URL(string: urlString) else {
            completion(.failure(.network(string: LocalizableStrings.urlFormat.localized)))
            return nil
        }
        
        let request = RequestFactory.request(method: .GET, url: url)
        
        do {
            let reachability = try? Reachability()
            switch reachability?.connection {
            case .none:
                completion(.failure(.network(string: LocalizableStrings.network.localized)))
            default:
                break
            }
        }
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(.network(string: LocalizableStrings.network.localized + error.localizedDescription)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.network(string: LocalizableStrings.network.localized + (error?.localizedDescription ?? ""))))
                return
            }
            
            guard let string = String(data: data, encoding: encoding) else {
                completion(.failure(.network(string: LocalizableStrings.network.localized + (error?.localizedDescription ?? ""))))
                return
            }
            
            guard let properData = string.data(using: .utf8, allowLossyConversion: true) else {
                completion(.failure(.network(string: LocalizableStrings.network.localized + (error?.localizedDescription ?? ""))))
                return
            }
            
            completion(.success(properData))
            
        }
        task.resume()
        return task
        
    }
    
}
