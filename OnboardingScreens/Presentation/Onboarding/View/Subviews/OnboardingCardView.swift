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
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        layer.cornerRadius = 20
        layer.masksToBounds = true
    }
    
    private func setup() {
        setupViews()
    }
    
    private func setupViews() {
        setupBackground()
        setupImage()
        setupMainLabel()
        setupCaptionLabel()
    }
    
    private func setupBackground() {
        backgroundColor = .hex045B9A24
        let blurEffect = UIBlurEffect(style: .dark)
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.frame = bounds
        visualEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        visualEffectView.layer.opacity = 0.52
        addSubview(visualEffectView)
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
        mainLabel.attributedText = page.mainText
        
        addSubview(mainLabel)
        mainLabel.snp.makeConstraints {
            $0.top.equalTo(pageImageView.snp.bottom).inset(-24)
            $0.left.right.equalToSuperview().inset(24)
            $0.height.equalTo(60)
        }
    }
    
    private func setupCaptionLabel() {
        captionLabel.attributedText = page.captionText
        
        addSubview(captionLabel)
        captionLabel.snp.makeConstraints {
            $0.top.equalTo(mainLabel.snp.bottom).inset(-16)
            $0.left.right.equalToSuperview().inset(24)
            $0.height.equalTo(40)
            $0.bottom.lessThanOrEqualTo(snp.bottom)
        }
    }
    
    func setup(for page: OnboardingPage) {
        pageImageView.image = page.image
        pageImageView.contentMode = .scaleAspectFill
        
        mainLabel.attributedText = page.mainText
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 0
        
        captionLabel.attributedText = page.captionText
        captionLabel.textAlignment = .center
        captionLabel.numberOfLines = 2
        captionLabel.adjustsFontSizeToFitWidth = true
        captionLabel.minimumScaleFactor = 0.5
        captionLabel.lineBreakMode = .byTruncatingTail
    }
}
