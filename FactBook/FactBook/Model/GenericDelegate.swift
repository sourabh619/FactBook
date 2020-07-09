//
//  GenericDelegate.swift
//  FactBook
//
//  Created by Sourabh Nag on 09/07/20.
//  Copyright © 2020 Sourabh Nag. All rights reserved.
//

import Foundation

/// By making this generic delegate we are restricting our viweModel to get the full ownership of the tableview delegate. This'll capture the index of the selected uitableviewcell.
class GenericDelegate<T>:NSObject {
    var didSelectItem:((Int) -> ())?
}

