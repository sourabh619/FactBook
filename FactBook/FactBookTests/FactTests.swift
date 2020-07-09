//
//  FactTests.swift
//  FactBookTests
//
//  Created by Sourabh Nag on 09/07/20.
//  Copyright © 2020 Sourabh Nag. All rights reserved.
//

import XCTest
@testable import FactBook

class FactTests: XCTestCase {

    func testParseEmptyFact() {
        
        // giving empty data
        let data = Data()
        
        // giving completion after parsing
        // expected valid FactInfo with valid data
        let completion : ((Result<FactsInfo, ErrorResult>) -> Void) = { result in
            switch result {
            case .success(_):
                XCTAssert(false, "Expected failure when no data")
            default:
                break
            }
        }
        
        ParserHelper.parse(data: data, completion: completion)
    }

    func testParse() {
        
        // giving a wrong dictionary
        let data = Data()
        
        // expected to return error of factInfo
        let result = FactsInfo.parseObject(data: data)
        
        switch result {
        case .success(_):
            XCTAssert(false, "Expected failure when wrong data")
        default:
            return
        }
    }
    
}
