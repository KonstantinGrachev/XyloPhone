//
//  SoundButton.swift
//  XyloPhone
//
//  Created by Konstantin Grachev on 26.01.2023.
//

import UIKit

final class SoundButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(color: UIColor, noteName: String) {
        self.init(type: .system)
        self.backgroundColor = color
        self.layer.cornerRadius = 10
        self.tintColor = .white
        self.setTitle(noteName, for: .normal)
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with color: UIColor, noteName: String) {
        
    }
    
}
