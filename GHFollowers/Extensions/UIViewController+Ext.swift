//
//  UIViewController+Ext.swift
//  GHFollowers
//
//  Created by Luiz Paulo on 16/06/25.
//

import UIKit
import SafariServices

extension UIViewController {
    func presentGFAlert(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
    
    func presentDefaultError() {
        presentGFAlert(title: "Someting went wrong", message: "Unable to complete your task at this time. Please, try again!", buttonTitle: "Ok")
    }
    
    func presentSafariVC(with url: URL) {
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredControlTintColor = .systemGreen
        present(safariVC, animated: true)
    }
}
