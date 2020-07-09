//
//  FactsViewModelTests.swift
//  FactBookTests
//
//  Created by Sourabh Nag on 09/07/20.
//  Copyright © 2020 Sourabh Nag. All rights reserved.
//

import XCTest
@testable import FactBook

class FactsViewModelTests: XCTestCase {

    var viewModel: FactsViewModel!
    var dataSource: GenericDataSource<FactsInfo>!
    var delegate: GenericDelegate<Int>!
    fileprivate var service: MockFactsService!
    
    override func setUp() {
        super.setUp()
        self.service = MockFactsService()
        self.dataSource = GenericDataSource<FactsInfo>()
        self.delegate = GenericDelegate<Int>()
        self.viewModel = FactsViewModel(service: service, dataSource: dataSource, delegate: delegate)
    }
    
    override func tearDown() {
        self.viewModel = nil
        self.dataSource = nil
        self.service = nil
        super.tearDown()
    }

    func testFetchWithNoService() {
        
        let expectation = XCTestExpectation(description: "No service facts")
        
        // giving no service to a view model
        viewModel.service = nil
        
        // expected to not to be able to fetch facts
        viewModel.onErrorHandling = { error in
            expectation.fulfill()
        }
        
        viewModel.fetchFacts()
        wait(for: [expectation], timeout: 5.0)
        
    }
    
    func testFetchFacts() {
        
        let expectation = XCTestExpectation(description: "Facts fetch")
        
        // mock fact
        service.factInfo = FactsInfo()
        
        viewModel.onErrorHandling = { _ in
            XCTAssert(false, "ViewModel should not be able to fetch without service")
        }
        
        dataSource.data.addObserver(self) { _ in
            expectation.fulfill()
        }
        
        viewModel.fetchFacts()
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testFetchNoFacts() {
        
        let expectation = XCTestExpectation(description: "No facts")
        
        // giving a service a mocking error
        service.factInfo = nil
        
        viewModel.onErrorHandling = { error in
            expectation.fulfill()
        }
        
        viewModel.fetchFacts()
        wait(for: [expectation], timeout: 5.0)
    }
    
}

fileprivate class MockFactsService : FactsServiceProtocol {
    
    var factInfo : FactsInfo?

    func fetchFacts(_ completion: @escaping ((Result<FactsInfo, ErrorResult>) -> Void)) {
        if let factInfo = factInfo {
            completion(Result.success(factInfo))
        } else {
            completion(Result.failure(ErrorResult.custom(string: "No Fact")))
        }
    }
}
