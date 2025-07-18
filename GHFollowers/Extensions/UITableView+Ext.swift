//
//  UITableView+Ext.swift
//  GHFollowers
//
//  Created by Luiz Paulo on 17/07/25.
//

import UIKit

extension UITableView {
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
    
    func reloadDaaOnMainThread() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
