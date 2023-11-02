//
//  SubscriptionManagerBarView.swift
//  OnboardingScreens
//
//  Created by Dmytro Hetman on 02.11.2023.
//

import UIKit

final class SubscriptionManagerBarView: UIView {
    
    private let restorePurchaseButtonView = UILabel()
    private let closeScreenImageView = UIImageView()
    
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        setupViews()
    }
    
    private func setupViews() {
        setupRestorePurchaseButtonView()
        setupCancelIcon()
    }
    
    private func setupRestorePurchaseButtonView() {
        restorePurchaseButtonView.attributedText = Parameters.OnboardingPage.SubscriptionManagerBarView.attributedText
        
        addSubview(restorePurchaseButtonView)
        restorePurchaseButtonView.snp.makeConstraints {
            $0.left.equalTo(16)
            $0.top.equalTo(13)
            $0.bottom.equalTo(-13)
            $0.height.equalTo(18)
            $0.width.equalTo(135)
        }
    }
    
    private func setupCancelIcon() {
        closeScreenImageView.image = Parameters.OnboardingPage.SubscriptionManagerBarView.cancelIcon
        closeScreenImageView.contentMode = .scaleAspectFit
        
        addSubview(closeScreenImageView)
        closeScreenImageView.snp.makeConstraints {
            $0.width.height.equalTo(24)
            $0.right.equalTo(-16)
            $0.centerY.equalTo(snp.centerY)
        }
    }
    
}
