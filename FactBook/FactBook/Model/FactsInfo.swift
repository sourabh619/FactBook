//
//  FactsInfo.swift
//  FactBook
//
//  Created by Sourabh Nag on 09/07/20.
//  Copyright © 2020 Sourabh Nag. All rights reserved.
//

import Foundation

struct FactsInfo: Codable {
    
    /// Encapsulated all the variables so that after they are only gettable and can't be set
    private var _title: String?
    private var _facts: [Fact] = []
    
    var title: String? {
        return _title
    }
    
    var facts: [Fact] {
        get {
            return _facts
        }
        set {
            _facts = newValue
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case _title = "title"
        case _facts = "rows"
    }
    
}

extension FactsInfo: Parceable {
    
    static func parseObject(data: Data) -> Result<FactsInfo, ErrorResult> {
        let decoder = JSONDecoder()
        do {
            var factInfo = try decoder.decode(FactsInfo.self, from: data)
            let filteredFacts = factInfo.facts.filter { (fact) -> Bool in
                if fact.image != nil, fact.title != nil, fact.description != nil {
                    return true
                }
                return false
            }
            factInfo.facts = filteredFacts
            return Result.success(factInfo)
        }catch {
            return Result.failure(.parser(string: LocalizableStrings.parser.localized))
        }
    }
    
}
