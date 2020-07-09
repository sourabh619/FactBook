//
//  FactsViewModel.swift
//  FactBook
//
//  Created by Sourabh Nag on 09/07/20.
//  Copyright © 2020 Sourabh Nag. All rights reserved.
//

import Foundation

struct FactsViewModel {
    
    weak var dataSource: GenericDataSource<FactsInfo>?
    weak var delegate: GenericDelegate<Int>?
    weak var service: FactsServiceProtocol?
    var onErrorHandling: ((ErrorResult?) -> Void)?
    
    init(service: FactsServiceProtocol = FactsService.shared,dataSource: GenericDataSource<FactsInfo>, delegate:GenericDelegate<Int>) {
        self.dataSource = dataSource
        self.delegate = delegate
        self.service = service
    }
    
    func fetchFacts() {
        guard let service = service else {
            onErrorHandling?(ErrorResult.custom(string: LocalizableStrings.missingService.localized))
            return
        }
        
        service.fetchFacts { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let factsInfo) :
                    self.dataSource?.data.value = [factsInfo]
                case .failure(let error) :
                    self.onErrorHandling?(error)
                }
            }
        }
    }
    
    func dataCount() -> Int {
        return dataSource?.data.value.first?.facts.count ?? 0
    }
    
}
