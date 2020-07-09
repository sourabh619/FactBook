//
//  FactsDataSource.swift
//  FactBook
//
//  Created by Sourabh Nag on 09/07/20.
//  Copyright © 2020 Sourabh Nag. All rights reserved.
//

import Foundation
import UIKit

class FactsDataSource : GenericDataSource<FactsInfo>, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.first?.facts.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FactTableViewCell.reuseIdentifier) as? FactTableViewCell else {
            return UITableViewCell()
        }
        if let fact = data.value.first?.facts[indexPath.row] {
            cell.configure(with: fact)
        }
        return cell
    }
    
}
