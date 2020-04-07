//
//  ViewController.swift
//  KVO-Project
//
//  Created by Kelby Mittan on 4/7/20.
//  Copyright © 2020 Kelby Mittan. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var welcomeLabel: UILabel!
    
    @IBOutlet var iconImageView: UIImageView!
    
    private var fontSizeObservation: NSKeyValueObservation?
    private var iconNameObservation: NSKeyValueObservation?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configObservers()
    }

    private func configObservers() {
        configFontSizeObservation()
        configIconNameObservation()
    }

    private func configFontSizeObservation() {
        fontSizeObservation = Settings.shared.observe(\.fontSize, options: [.old,.new], changeHandler: { [weak self](settings, change) in
            
            guard let newSize = change.newValue else { return }
            let fontSize = CGFloat(newSize)
            self?.welcomeLabel.font = UIFont.systemFont(ofSize: fontSize)
        })
    }
    
    private func configIconNameObservation() {
        iconNameObservation = Settings.shared.observe(\.iconName, options: [.old,.new], changeHandler: { [weak self](settings, change) in
            guard let iconName = change.newValue else {return}
            self?.iconImageView.image = UIImage(systemName: iconName)
        })
    }
    
    deinit {
        
    }
}

