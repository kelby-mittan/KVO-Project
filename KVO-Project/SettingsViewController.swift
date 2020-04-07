//
//  SettingsViewController.swift
//  KVO-Project
//
//  Created by Kelby Mittan on 4/7/20.
//  Copyright © 2020 Kelby Mittan. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var fontSizeLabel: UILabel!
    
    @IBOutlet var pickerView: UIPickerView!
    
    private let iconNames = ["sun.haze.fill", "moon", "globe", "icloud"]
    
    private var fontSizeObservation: NSKeyValueObservation?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configPickerView()
        configFontSizeObservation()
    }
    
    private func configPickerView() {
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    private func configFontSizeObservation() {
        fontSizeObservation = Settings.shared.observe(\.fontSize, options: [.old,.new], changeHandler: { [weak self](settings, change) in
            guard let newSize = change.newValue else { return }
            self?.fontSizeLabel.text = newSize.description
        })
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        let newSize = Int(sender.value)
        Settings.shared.fontSize = newSize
    }
    
}

extension SettingsViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return iconNames[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let iconName = iconNames[row]
        
        Settings.shared.iconName = iconName
    }
}

extension SettingsViewController: UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return iconNames.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
}
