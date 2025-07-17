//
//  GFButton.swift
//  GHFollowers
//
//  Created by Luiz Paulo on 16/06/25.
//

import UIKit

class GFButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(backgroundColor: UIColor, title: String) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
        setTitle(title, for: .normal)
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
    }
    
    func set(backgroundColor: UIColor, title: String) {
        self.backgroundColor = backgroundColor
        setTitle(title, for: .normal)
    }
}
