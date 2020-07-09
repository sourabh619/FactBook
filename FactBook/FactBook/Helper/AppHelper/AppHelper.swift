//
//  AppHelper.swift
//  FactBook
//
//  Created by Sourabh Nag on 09/07/20.
//  Copyright © 2020 Sourabh Nag. All rights reserved.
//

import UIKit

class AppHelper {
    
    static let shared: AppHelper = AppHelper()
    
    /// The empty initilizer has been kept private so that there will be only one object possible
    private init() {}
    
    /// This function returns a  UIWindow with a rootController attached. This function is also responsible for the initial setup of the UINavigation Controller
    func set(rootController: UIViewController, to window: UIWindow) -> UIWindow {
        let navigationController = UINavigationController(rootViewController: rootController)
        navigationController.navigationBar.barTintColor = Constants.Theme.Color.navigationBar
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController.navigationBar.titleTextAttributes = textAttributes
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        return window
    }
    
    func showAlert(on controller: UIViewController?,retryAction: @escaping(UIAlertAction) -> ()) {
        let alertController = UIAlertController(title: LocalizableStrings.errorOccured.localized, message: LocalizableStrings.somethingWentWrong.localized, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: LocalizableStrings.retry.localized, style: .default, handler: retryAction))
        alertController.addAction(UIAlertAction(title: LocalizableStrings.cancel.localized, style: .cancel, handler: nil))
        controller?.present(alertController, animated: true, completion: nil)
    }
    
}
