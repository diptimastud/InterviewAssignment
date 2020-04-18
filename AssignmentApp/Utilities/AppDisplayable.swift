//
//  AppDisplayable.swift
//  Countries
//
//  Created by Dipti Mastud on 17/04/20.
//  Copyright © 2020 Dipti Mastud. All rights reserved.
//

import Foundation
import UIKit
import MBProgressHUD

protocol AppDisplayable {
    
    /// Shows activity indiator with given message.
    /// - Parameter message: Message that needs to be shown on activity indicator.
    func showHUD(progressLabel:String)
    
    /// Hides currently shown activity indiator.
    func dismissHUD(isAnimated:Bool)
    
    /// Shows alert message on current view controller.
    /// - Parameter title: Title for alert.
    /// - Parameter message: Message that needs to be shown on alert.
    func showMessage(title: String, message : String)
}

extension AppDisplayable where Self: UIViewController {
    
    /// Shows activity indiator with given message.
    /// - Parameter progressLabel: Message that needs to be shown on activity indicator.
    func showHUD(progressLabel:String) {
        let progressHUD = MBProgressHUD.showAdded(to: self.view, animated: true)
        progressHUD.label.text = progressLabel
    }
    
    /// Hides currently shown activity indiator.
    func dismissHUD(isAnimated:Bool) {
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: self.view, animated: isAnimated)
        }
    }
    
    /// Shows alert message on current view controller.
    /// - Parameter title: Title for alert.
    /// - Parameter message: Message that needs to be shown on alert.
    func showMessage(title: String, message : String)
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .cancel) {
            (action: UIAlertAction) in
        }
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}
