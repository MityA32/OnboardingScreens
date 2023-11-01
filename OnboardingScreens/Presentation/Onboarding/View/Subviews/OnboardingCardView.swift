//
//  OnboardingCardView.swift
//  OnboardingScreens
//
//  Created by Dmytro Hetman on 31.10.2023.
//

import UIKit
import SnapKit

final class OnboardingCardView: UIView {
    
    private let pageImageView = UIImageView()
    private let mainLabel = UILabel()
    private let captionLabel = UILabel()
    
    var page: OnboardingPage
    
    init(page: OnboardingPage = .yourPersonalAssistant) {
        self.page = page
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
        setupImage()
        setupMainLabel()
        setupCaptionLabel()
    }
    
    private func setupImage() {
        pageImageView.image = page.image
        
        addSubview(pageImageView)
        pageImageView.snp.makeConstraints {
            $0.top.equalTo(50)
            $0.left.right.equalToSuperview().inset(24)
            $0.height.equalToSuperview().multipliedBy(0.55)
        }
    }
    
    private func setupMainLabel() {
        
        
        addSubview(pageImageView)
        pageImageView.snp.makeConstraints {
            $0.top.equalTo(50)
            $0.left.right.equalToSuperview().inset(24)
            $0.height.equalToSuperview().multipliedBy(0.55)
        }
    }
    
    private func setupCaptionLabel() {
        
    }
    
}
