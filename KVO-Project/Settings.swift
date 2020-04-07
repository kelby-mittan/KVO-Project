//
//  Settings.swift
//  KVO-Project
//
//  Created by Kelby Mittan on 4/7/20.
//  Copyright © 2020 Kelby Mittan. All rights reserved.
//

import Foundation

@objc class Settings: NSObject {
    static var shared = Settings()
    @objc dynamic var fontSize: Int
    @objc dynamic var iconName: String
    override private init() {
        fontSize = 17
        iconName = "sun.haze.fill"
    }
}
