//
//  Parameters.swift
//  OnboardingScreens
//
//  Created by Dmytro Hetman on 02.11.2023.
//

import UIKit

enum Parameters {
    
    enum OnboardingPage {
        
        static let iconSecondPageControl = "icon_second_page_control".image
        static let iconThirdPageControl = "icon_third_page_control".image
        
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
        
        enum SubscriptionManagerBarView {
            static let attributedText = {
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.minimumLineHeight = 18
                paragraphStyle.maximumLineHeight = 18
                let attributes: [NSAttributedString.Key : Any] = [
                    .foregroundColor: AssetColor.hex9099A6 ?? .lightGray,
                    .font: CustomFont.sfProText(ofSize: 14, weight: .medium) ?? .systemFont(ofSize: 14, weight: .medium),
                    .kern: -0.15,
                    .paragraphStyle: paragraphStyle]
                return NSAttributedString(string: "Restore Purchase", attributes: attributes)
            }()
            
            static let cancelIcon = {
                "icon_cancel".image
            }()
        }
        
        enum TermsLabel {
            static let attributedText = {
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.lineSpacing = 0
                paragraphStyle.minimumLineHeight = 14
                paragraphStyle.maximumLineHeight = 14
                let termsFont = UIFont(name: "SFProText-Regular", size: 12) ?? .systemFont(ofSize: 12, weight: .regular)
                let grayTextAttributes: [NSAttributedString.Key : Any] = [
                    NSAttributedString.Key.foregroundColor: AssetColor.hex6E6E73 ?? .gray,
                    NSAttributedString.Key.paragraphStyle: paragraphStyle,
                    NSAttributedString.Key.font: termsFont]
                let blueTextAttributes: [NSAttributedString.Key : Any] = [
                    NSAttributedString.Key.foregroundColor: AssetColor.hex208BFF ?? .blue,
                    NSAttributedString.Key.paragraphStyle: paragraphStyle,
                    NSAttributedString.Key.font: termsFont
                ]
                
                let startAttributedText = NSMutableAttributedString(
                    string: "By continuing you accept our:\n",
                    attributes: grayTextAttributes)
                
                let termsOfUseText = NSMutableAttributedString(
                    string: PrivacyCenterOption.termsOfUse.title,
                    attributes: blueTextAttributes)
                termsOfUseText.addAttribute(
                    .link,
                    value: PrivacyCenterOption.termsOfUse.link,
                    range: termsOfUseText.fullLengthRange)
                
                let commaText = NSAttributedString(string: ", ", attributes: grayTextAttributes)
                let privacyPolicyText = NSMutableAttributedString(
                    string: PrivacyCenterOption.privacyPolicy.title,
                    attributes: blueTextAttributes)
                privacyPolicyText.addAttribute(
                    .link,
                    value: PrivacyCenterOption.privacyPolicy.link,
                    range: privacyPolicyText.fullLengthRange)
                
                let andText = NSAttributedString(string: " and ", attributes: grayTextAttributes)
                
                let subscriptionTermsText = NSMutableAttributedString(
                    string: PrivacyCenterOption.subscriptionTerms.title,
                    attributes: blueTextAttributes)
                subscriptionTermsText.addAttribute(
                    .link,
                    value: PrivacyCenterOption.subscriptionTerms.link,
                    range: subscriptionTermsText.fullLengthRange)
                 
                startAttributedText.append(termsOfUseText)
                startAttributedText.append(commaText)
                startAttributedText.append(privacyPolicyText)
                startAttributedText.append(andText)
                startAttributedText.append(subscriptionTermsText)
                return startAttributedText
            }()
        }
    }
    
}
