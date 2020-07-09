//
//  FactBookDataSourceTests.swift
//  FactBookTests
//
//  Created by Sourabh Nag on 09/07/20.
//  Copyright © 2020 Sourabh Nag. All rights reserved.
//

import XCTest
@testable import FactBook

class FactBookDataSourceTests: XCTestCase {

    var dataSource: FactsDataSource!
    
    override func setUp() {
        super.setUp()
        dataSource = FactsDataSource()
    }
    
    override func tearDown() {
        dataSource = nil
        super.tearDown()
    }
    
    func testEmptyValueInDataSource() {
        
        dataSource.data.value = []
        
        let tableView = UITableView()
        tableView.dataSource = dataSource
        
        // expected one section
        XCTAssertEqual(dataSource.numberOfSections(in: tableView), 1, "Expected one section in table view")
        
        // expected zero cells
        XCTAssertEqual(dataSource.tableView(tableView, numberOfRowsInSection: 0), 0, "Expected no cell in table view")
    }
    
    func testValueInDataSource() {
        
        // giving data value
        let transportationfact = Fact()
        let housingFact = Fact()
        var factInfo = FactsInfo()
        factInfo.facts = [transportationfact,housingFact]
        dataSource.data.value = [factInfo]
        
        let tableView = UITableView()
        tableView.dataSource = dataSource
        
        // expected one section
        XCTAssertEqual(dataSource.numberOfSections(in: tableView), 1, "Expected one section in table view")
        
        // expected two cells
        XCTAssertEqual(dataSource.tableView(tableView, numberOfRowsInSection: 0), 2, "Expected two cell in table view")
    }
    
    func testValueCell() {
        
        // giving data value
        let housingFact = Fact()
        var factInfo = FactsInfo()
        factInfo.facts = [housingFact]
        dataSource.data.value = [factInfo]
        
        let tableView = UITableView()
        tableView.dataSource = dataSource
        tableView.register(FactTableViewCell.self, forCellReuseIdentifier: FactTableViewCell.reuseIdentifier)
        
        let indexPath = IndexPath(row: 0, section: 0)
        
        // expected CurrencyCell class
        guard let _ = dataSource.tableView(tableView, cellForRowAt: indexPath) as? FactTableViewCell else {
            XCTAssert(false, "Expected fact cell class")
            return
        }
    }

}
