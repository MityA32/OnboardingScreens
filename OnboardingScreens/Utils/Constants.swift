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

enum Parameters {
    
    enum OnboardingPage {
        
        enum ActionButton {
            static let textColor = UIColor.hex191F28
            static let lineHeight: CGFloat = 20
            static let lineSpacing: CGFloat = 0
            static let font = CustomFont.sfProText(ofSize: 17, weight: .medium) ?? UIFont.systemFont(ofSize: 17, weight: .medium)
        }
        
        enum MainText {
            static let foregroundColor = UIColor.white
            static let lineHeight: CGFloat = 30
            static let lineSpacing: CGFloat = 0
            static let font = CustomFont.sfProDisplay(ofSize: 26, weight: .bold) ?? UIFont.systemFont(ofSize: 26, weight: .bold)
            static let kern = 0.37
        }
        
        enum CaptionText {
            static let foregroundColor = AssetColor.hexE3E3E3 ?? .lightGray
            static let lineHeight: CGFloat = 20
            static let subscriptionLineHeight: CGFloat = 19.09
            static let subscriptionPriceLineHeight: CGFloat = 18
            static let lineSpacing: CGFloat = 0
            static let sfProDisplayMediumFont = CustomFont.sfProDisplay(ofSize: 17, weight: .medium) ?? UIFont.systemFont(ofSize: 17, weight: .medium)
            static let sfProTextMediumFont = CustomFont.sfProText(ofSize: 16, weight: .medium) ?? UIFont.systemFont(ofSize: 16, weight: .medium)
            static let sfProTextBoldFont = CustomFont.sfProText(ofSize: 16, weight: .bold) ?? UIFont.systemFont(ofSize: 16, weight: .bold)
            
            
            
            
        }
        
        
    }
    
}
