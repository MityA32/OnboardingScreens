//
//  OnboardingPage.swift
//  OnboardingScreens
//
//  Created by Dmytro Hetman on 01.11.2023.
//

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
        let parameters = Parameters.OnboardingPage.ActionButton.self
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = parameters.lineHeight
        paragraphStyle.maximumLineHeight = parameters.lineHeight
        paragraphStyle.lineSpacing = parameters.lineSpacing
        
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: parameters.textColor,
            .font: parameters.font,
            .paragraphStyle: paragraphStyle]
        
        switch self {
            case .yourPersonalAssistant, .getAssistanceWithAnyTopic, .perfectCopyYouCanRelyOn:
                return ActionButtonConfig(
                    textColor: AssetColor.hex191F28,
                    title: NSAttributedString(string: "Continue", attributes: attributes))
            case .upgrageForUnlimitedAICapabilities:
                return ActionButtonConfig(
                    textColor: AssetColor.hex191F28,
                    title: NSAttributedString(string: "Try Free & Subscribe", attributes: attributes))
        }
    }
    
    var mainText: NSAttributedString {
        let parameters = Parameters.OnboardingPage.MainText.self
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = parameters.lineHeight
        paragraphStyle.maximumLineHeight = parameters.lineHeight
        paragraphStyle.lineSpacing = parameters.lineSpacing
        
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: parameters.foregroundColor,
            .font: parameters.font,
            .kern: parameters.kern,
            .paragraphStyle: paragraphStyle]
        
        switch self {
            case .yourPersonalAssistant:
                return NSAttributedString(string: "Your Personal\nAssistant", attributes: attributes)
            case .getAssistanceWithAnyTopic:
                return NSAttributedString(string: "Get assistance\nwith any topic", attributes: attributes)
            case .perfectCopyYouCanRelyOn:
                return NSAttributedString(string: "Perfect copy\nyou can rely on", attributes: attributes)
            case .upgrageForUnlimitedAICapabilities:
                return NSAttributedString(string: "Upgrage for Unlimited\nAI Capabilities", attributes: attributes)
        }
    }
    
    var captionText: NSAttributedString {
        let parameters = Parameters.OnboardingPage.CaptionText.self
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = parameters.lineHeight
        paragraphStyle.maximumLineHeight = parameters.lineHeight
        paragraphStyle.lineSpacing = parameters.lineSpacing
        
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: parameters.foregroundColor,
            .font: parameters.sfProDisplayMediumFont,
            .paragraphStyle: paragraphStyle]
        
        switch self {
        case .yourPersonalAssistant:
            return NSMutableAttributedString(string: "Simplify your life\nwith an AI companion", attributes: attributes)
            
        case .getAssistanceWithAnyTopic:
            return NSMutableAttributedString(
                string: "From daily tasks to complex\nqueries, we’ve got you covered",
                attributes: attributes)
            
        case .perfectCopyYouCanRelyOn:
            return NSMutableAttributedString(string: "Generate professional\ntexts effortlessly", attributes: attributes)
            
        case .upgrageForUnlimitedAICapabilities:
            let parameters = Parameters.OnboardingPage.CaptionText.self
            
            let subscriptionParagraphStyle = NSMutableParagraphStyle()
            subscriptionParagraphStyle.minimumLineHeight = parameters.subscriptionLineHeight
            subscriptionParagraphStyle.maximumLineHeight = parameters.subscriptionLineHeight
            subscriptionParagraphStyle.lineSpacing = parameters.lineSpacing
            
            let priceParagraphStyle = NSMutableParagraphStyle()
            priceParagraphStyle.minimumLineHeight = parameters.subscriptionPriceLineHeight
            priceParagraphStyle.maximumLineHeight = parameters.subscriptionPriceLineHeight
            priceParagraphStyle.lineSpacing = parameters.lineSpacing
            
            let upgrageForUnlimitedAICapabilitiesAttributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: parameters.foregroundColor,
                .font: parameters.sfProTextMediumFont,
                .paragraphStyle: subscriptionParagraphStyle]
            
            let priceAttributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: parameters.foregroundColor,
                .font: parameters.sfProTextBoldFont,
                .paragraphStyle: priceParagraphStyle]
            
            let startString = NSMutableAttributedString(string: "7-Day Free Trial,\nthen ", attributes: upgrageForUnlimitedAICapabilitiesAttributes)
            let priceString = NSAttributedString(string: "$19.99 ", attributes: priceAttributes)
            let additionalInfoString = NSMutableAttributedString(string: "/month, auto-renewable", attributes: upgrageForUnlimitedAICapabilitiesAttributes)
            
            startString.append(priceString)
            startString.append(additionalInfoString)
            
            return startString
        }
    }
}
