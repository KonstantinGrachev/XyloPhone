//
//  ViewController.swift
//  XyloPhone
//
//  Created by Konstantin Grachev on 25.01.2023.
//

import UIKit
import AVFoundation

final class MainViewController: UIViewController {
    
    private let buttons = [SoundButton(color: .blue, noteName: "C"),
                           SoundButton(color: .orange, noteName: "D"),
                           SoundButton(color: .brown, noteName: "E"),
                           SoundButton(color: .systemGreen, noteName: "F"),
                           SoundButton(color: .gray, noteName: "G"),
                           SoundButton(color: .red, noteName: "A"),
                           SoundButton(color: .systemPink, noteName: "B"),]
    
    private lazy var buttonsStackView = UIStackView(arrangedSubviews: buttons)
    
    private var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtonsInStackView()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .secondarySystemBackground
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.axis = .vertical
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.spacing = 15
        
        view.addSubview(buttonsStackView)
        
        NSLayoutConstraint.activate([
            buttonsStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            buttonsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            buttonsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
            buttonsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupButtonsInStackView() {
        var leadingStep: CGFloat = 0
        var trailingStep: CGFloat = 0
        
        buttons.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.addTarget(self, action: #selector(soundButtonPressed), for: .touchUpInside)
            
            NSLayoutConstraint.activate([
                $0.leadingAnchor.constraint(equalTo: buttonsStackView.leadingAnchor, constant: leadingStep),
                $0.trailingAnchor.constraint(equalTo: buttonsStackView.trailingAnchor, constant: trailingStep)
            ])
            
            leadingStep += 5
            trailingStep -= 5
        }
    }
    
    @objc private func soundButtonPressed(_ sender: UIButton) {
        guard let noteName = sender.currentTitle else { return }
        playSound(noteName)
    }
    
    private func playSound(_ note: String) {
        
        guard let path = Bundle.main.path(forResource: note, ofType: "wav") else { return }
        
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

