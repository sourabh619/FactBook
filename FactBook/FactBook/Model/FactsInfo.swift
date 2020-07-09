//
//  FactsInfo.swift
//  FactBook
//
//  Created by Sourabh Nag on 09/07/20.
//  Copyright © 2020 Sourabh Nag. All rights reserved.
//

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
