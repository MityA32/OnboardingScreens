//
//  ViewController.swift
//  OnboardingScreens
//
//  Created by Dmytro Hetman on 31.10.2023.
//

import UIKit
import RxSwift
import SnapKit

final class OnboardingScreensViewController: UIViewController {

    private let backgroundImageView = UIImageView()
    private let cardView = OnboardingCardView()
    private let termsLabel = UITextView()
    private let actionButton = UIButton()
    private let viewModel = OnboardingScreensViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        actionButton.layer.cornerRadius = actionButton.frame.height / 2
    }

    private func setup() {
        navigationController?.isNavigationBarHidden = true
        setupBackground()
        setupTermsLabel()
        setupActionButton()
        setupCardViews()
    }
    
    private func setupBackground() {
        backgroundImageView.image = AssetImage.onboardingBackgroundDark
        view.addSubview(backgroundImageView)
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setupTermsLabel() {
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
        
        termsLabel.attributedText = startAttributedText
        termsLabel.textAlignment = .center
        termsLabel.delegate = self
        termsLabel.isEditable = false
        termsLabel.isScrollEnabled = false
        termsLabel.backgroundColor = .clear
        termsLabel.isSelectable = true
        termsLabel.textContainer.lineFragmentPadding = 0
        termsLabel.textContainerInset = .zero
        view.addSubview(termsLabel)
        
        termsLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.left.right.equalToSuperview().inset(36)
            $0.height.equalTo(28)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    private func setupActionButton() {
        actionButton.backgroundColor = .white
        actionButton.setAttributedTitle(viewModel.currentPage.actionButtonText.title, for: .normal)
        
        view.addSubview(actionButton)
        actionButton.snp.makeConstraints {
            $0.height.equalTo(56)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(52)
            $0.left.right.equalToSuperview().inset(30)
        }
    }

    private func setupCardViews() {
        
        view.addSubview(cardView)
        cardView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(56)
            $0.left.right.equalToSuperview().inset(30)
            $0.bottom.equalTo(actionButton.snp.top).inset(-28)
        }
    }
}

extension OnboardingScreensViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
        UIApplication.shared.open(URL)
        return false
    }
}
