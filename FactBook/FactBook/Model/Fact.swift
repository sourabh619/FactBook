//
//  Fact.swift
//  FactBook
//
//  Created by Sourabh Nag on 09/07/20.
//  Copyright © 2020 Sourabh Nag. All rights reserved.
//

struct Fact: Codable {
    
    /// Encapsulated all the variables so that after they are only gettable and can't be set
    private var _title: String?
    private var _description: String?
    private var _image: String?
    
    var title: String? {
        return _title
    }
    
    var description: String? {
        return _description
    }
    
    var image: String? {
        return _image
    }
    
    enum CodingKeys: String, CodingKey {
        case _title = "title"
        case _description = "description"
        case _image = "imageHref"
    }
    
}
