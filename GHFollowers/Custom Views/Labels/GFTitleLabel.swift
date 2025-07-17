//
//  GFTitleLabel.swift
//  GHFollowers
//
//  Created by Luiz Paulo on 16/06/25.
//

import UIKit

class GFTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init (textAlignemnt: NSTextAlignment, fontSize: CGFloat) {
        self.init(frame: .zero)
        textAlignment = textAlignemnt
        font = UIFont.systemFont(ofSize: fontSize, weight: UIFont.Weight.bold)
    }
    
    private func configure() {
        textColor = .label
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.90
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
}
