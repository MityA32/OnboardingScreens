//
//  SubscriptionManagerBarView.swift
//  OnboardingScreens
//
//  Created by Dmytro Hetman on 02.11.2023.
//

import UIKit
import RxSwift

final class SubscriptionManagerBarView: UIView {
    
    private let restorePurchaseButtonView = UIButton()
    private let closeScreenButton = UIButton()
    
    let inRestorePurchaseClick = PublishSubject<Void>()
    let inCloseClick = PublishSubject<Void>()
    let disposeBag = DisposeBag()
    
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
        restorePurchaseButtonView.setAttributedTitle(Parameters.OnboardingPage.SubscriptionManagerBarView.attributedText, for: .normal)
        restorePurchaseButtonView.isHighlighted = false
        
        restorePurchaseButtonView.rx.tap
            .bind(to: inRestorePurchaseClick)
            .disposed(by: disposeBag)
        
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
        closeScreenButton.setImage(Parameters.OnboardingPage.SubscriptionManagerBarView.cancelIcon, for: .normal)
        
        closeScreenButton.contentMode = .scaleAspectFit
        
        closeScreenButton.rx.tap
            .bind(to: inCloseClick)
            .disposed(by: disposeBag)
        
        addSubview(closeScreenButton)
        closeScreenButton.snp.makeConstraints {
            $0.width.height.equalTo(24)
            $0.right.equalTo(-16)
            $0.centerY.equalTo(snp.centerY)
        }
    }
    
}
