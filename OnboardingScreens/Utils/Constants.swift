//
//  Constants.swift
//  OnboardingScreens
//
//  Created by Dmytro Hetman on 31.10.2023.
//

import UIKit

enum AssetImage {
    static let onboardingBackgroundDark = "image_dark_onboarding_background".image
    static let onboardingBackgroundLight = "image_light_onboarding_background".image
}

enum AssetColor {
    static let hex208BFF = "hex_208BFF".color
    static let hex6E6E73 = "hex_6E6E73".color
    static let hexE3E3E3 = "hex_E3E3E3".color
    static let hex191F28 = "hex_191F28".color
    static let hex9099A6 = "hex_9099A6".color
}

enum CustomFont {
    static func sfProText(ofSize size: CGFloat, weight: Weight) -> UIFont? {
        UIFont(name: "SFProText\(weight.rawValue)", size: size)
    }
    
    static func sfProDisplay(ofSize size: CGFloat, weight: Weight) -> UIFont? {
        UIFont(name: "SFProDisplay\(weight.rawValue)", size: size)
    }
    
    
    enum Weight: String {
        case bold = "-Bold"
        case medium = "-Medium"
        case regular = "-Regular"
    }
}
