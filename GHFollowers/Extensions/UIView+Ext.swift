//
//  UIView+Ext.swift
//  GHFollowers
//
//  Created by Luiz Paulo on 17/07/25.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { view in
            addSubview(view)
        }
    }
}
