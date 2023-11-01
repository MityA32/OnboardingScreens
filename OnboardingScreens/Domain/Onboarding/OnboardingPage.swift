//
//  OnboardingPage.swift
//  OnboardingScreens
//
//  Created by Dmytro Hetman on 01.11.2023.
//

import Foundation
import UIKit

enum OnboardingPage: CaseIterable {
    case yourPersonalAssistant
    case getAssistanceWithAnyTopic
    case perfectCopyYouCanRelyOn
    case upgrageForUnlimitedAICapabilities
}

extension OnboardingPage {
    var image: UIImage? {
        switch self {
        case .yourPersonalAssistant:
            return "image_onboarding_illustration1".image
        case .getAssistanceWithAnyTopic:
            return "image_onboarding_illustration2".image
        case .perfectCopyYouCanRelyOn:
            return "image_onboarding_illustration3".image
        case .upgrageForUnlimitedAICapabilities:
            return "image_onboarding_illustration4".image
        }
    }
    
    var actionButtonText: ActionButtonConfig {
        switch self {
        case .yourPersonalAssistant, .getAssistanceWithAnyTopic, .perfectCopyYouCanRelyOn:
            return ActionButtonConfig(textColor: AssetColor.hex191F28, title: "Continue")
        case .upgrageForUnlimitedAICapabilities:
            return ActionButtonConfig(textColor: AssetColor.hex191F28, title: "Try Free & Subscribe")
        }
    }
    
    var mainText: NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = 30
        paragraphStyle.maximumLineHeight = 30
        paragraphStyle.lineSpacing = 0
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .font: UIFont(name: "SFProDisplay-Bold", size: 26) ?? UIFont.systemFont(ofSize: 26, weight: .bold),
            .kern: 0.37,
            .paragraphStyle: paragraphStyle]
        
        switch self {
            case .yourPersonalAssistant:
                return NSAttributedString(string: "Your Personal Assistant", attributes: attributes)
            case .getAssistanceWithAnyTopic:
                return NSAttributedString(string: "Get assistance with any topic", attributes: attributes)
            case .perfectCopyYouCanRelyOn:
                return NSAttributedString(string: "Perfect copy you can rely on", attributes: attributes)
            case .upgrageForUnlimitedAICapabilities:
                return NSAttributedString(string: "Upgrage for Unlimited AI Capabilities", attributes: attributes)
        }
    }
    
    var captionText: NSMutableAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = 20
        paragraphStyle.maximumLineHeight = 20
        paragraphStyle.lineSpacing = 0
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: AssetColor.hexE3E3E3 ?? .lightGray,
            .font: UIFont(name: "SFProDisplay-Medium", size: 17) ?? UIFont.systemFont(ofSize: 17, weight: .medium),
            .paragraphStyle: paragraphStyle]
        let upgrageForUnlimitedAICapabilitiesAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: AssetColor.hexE3E3E3 ?? .lightGray,
            .font: UIFont(name: "SFPro-Medium", size: 17) ?? UIFont.systemFont(ofSize: 17, weight: .medium),
            .paragraphStyle: paragraphStyle]
        let priceAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: AssetColor.hexE3E3E3 ?? .lightGray,
            .font: UIFont(name: "SFPro-Bold", size: 17) ?? UIFont.systemFont(ofSize: 17, weight: .medium),
            .paragraphStyle: paragraphStyle]
        
        switch self {
        case .yourPersonalAssistant:
            return NSMutableAttributedString(string: "Simplify your life with an AI companion", attributes: attributes)
            
        case .getAssistanceWithAnyTopic:
            return NSMutableAttributedString(
                string: "From daily tasks to complex queries, we’ve got you covered",
                attributes: attributes)
            
        case .perfectCopyYouCanRelyOn:
            return NSMutableAttributedString(string: "Generate professional texts effortlessly", attributes: attributes)
            
        case .upgrageForUnlimitedAICapabilities:
            let startString = NSMutableAttributedString(string: "7-Day Free Trial,\nthen ", attributes: upgrageForUnlimitedAICapabilitiesAttributes)
            let priceString = NSAttributedString(string: "$19.99", attributes: priceAttributes)
            let additionalInfoString = NSMutableAttributedString(string: " /month, auto-renewable", attributes: upgrageForUnlimitedAICapabilitiesAttributes)
            startString.append(priceString)
            startString.append(additionalInfoString)
            
            return startString
        }
    }
}
