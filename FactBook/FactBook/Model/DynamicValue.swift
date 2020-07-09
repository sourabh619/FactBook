//
//  DynamicValue.swift
//  FactBook
//
//  Created by Sourabh Nag on 09/07/20.
//  Copyright © 2020 Sourabh Nag. All rights reserved.
//

import Foundation

class DynamicValue<Element> {
    
    typealias CompletionHandler = ((Element) -> Void)
    
    var value: Element {
        didSet {
            self.notify()
        }
    }
    
    /// This will capture all the objects that are listening to changes in the value
    private var observers = [String: CompletionHandler]()
    
    init(_ value: Element) {
        self.value = value
    }
    
    /// This will add an obejct to observers table to listen to changes in the value
    public func addObserver(_ observer: NSObject, completionHandler: @escaping(CompletionHandler)) {
        observers[observer.description] = completionHandler
    }
    
    /// This will add an obejct to observers table to listen to changes in the value and quickly notify that the obsever has been added
    public func addAndNotify(observer: NSObject, completionHandler: @escaping(CompletionHandler)) {
        self.addObserver(observer, completionHandler: completionHandler)
        self.notify()
    }
    
    /// Fires all the observers that are listening to the changes in value
    private func notify() {
        observers.forEach({$0.value(value)})
    }
    
    deinit {
        observers.removeAll()
    }
}
