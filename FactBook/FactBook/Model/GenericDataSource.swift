//
//  GenericDataSource.swift
//  FactBook
//
//  Created by Sourabh Nag on 09/07/20.
//  Copyright © 2020 Sourabh Nag. All rights reserved.
//

import Foundation

/// By making this generic data source we'll restrict our viewModel ownership to the tableview datasource. We'll capture our response model into data parameter which will be our notifier to the UIViewController about the changes in data
class GenericDataSource<Element>: NSObject {
    var data:DynamicValue<[Element]> = DynamicValue([])
}
