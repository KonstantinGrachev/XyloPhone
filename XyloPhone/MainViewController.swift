//
//  ViewController.swift
//  XyloPhone
//
//  Created by Konstantin Grachev on 25.01.2023.
//

import UIKit
import AVFoundation

final class MainViewController: UIViewController {
    
    private let buttons = [SoundButton(color: .cyan, noteName: "A"),
                           SoundButton(color: .red, noteName: "B"),
                           SoundButton(color: .blue, noteName: "C"),
                           SoundButton(color: .orange, noteName: "D"),
                           SoundButton(color: .brown, noteName: "E"),
                           SoundButton(color: .green, noteName: "F"),
                           SoundButton(color: .gray, noteName: "G")]
    
    private var buttonsStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .secondarySystemBackground
        
        view.addSubview(buttonsStackView)
        
        NSLayoutConstraint.activate([
            buttonsStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            buttonsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            buttonsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            buttonsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupButtonsStackView() {
        buttonsStackView.distribution = .fillEqually
        
        var step: CGFloat = 5
        
        for button in buttons {
            
            view.addSubview(button)
            
            NSLayoutConstraint.activate([
            
            ])
        }
    }
    
}

