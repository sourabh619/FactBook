//
//  FactBookServiceTests.swift
//  FactBookTests
//
//  Created by Sourabh Nag on 09/07/20.
//  Copyright © 2020 Sourabh Nag. All rights reserved.
//

import XCTest
@testable import FactBook

class FactBookServiceTests: XCTestCase {

    func testCancelRequest() {
        
        // giving a "previous" session
        FactsService.shared.fetchFacts { (_) in
            // ignore call
        }
        
        // Expected to task nil after cancel
        FactsService.shared.cancel()
        XCTAssertNil(FactsService.shared.task, "Expected task nil")
    }

}
