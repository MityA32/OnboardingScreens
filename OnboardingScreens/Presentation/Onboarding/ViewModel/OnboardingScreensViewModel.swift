//
//  OnboardingScreensViewModel.swift
//  OnboardingScreens
//
//  Created by Dmytro Hetman on 01.11.2023.
//

import Foundation
import RxSwift
import RxRelay

final class OnboardingScreensViewModel {
    
    let inNewPageClick = BehaviorRelay<Int>(value: 0)
    let currentPage = BehaviorRelay<OnboardingPageInfo?>(value: OnboardingPageInfo(.yourPersonalAssistant, 0))
    let manageOnboarding = PublishSubject<OnboardingEvent>()
    
    let disposeBag = DisposeBag()
    
    let pages = OnboardingPage.allCases
    
    let subscriptionService: SubscriptionServiceProtocol
    
    init(subscriptionService: SubscriptionServiceProtocol) {
        self.subscriptionService = subscriptionService
        setupRx()
    }
    
    private func setupRx() {
        inNewPageClick
            .filter { $0 < 4 }
            .map { [weak self] in
                guard let self else { return nil }
                return OnboardingPageInfo(self.pages[$0], $0)
            }
            .bind(to: currentPage)
            .disposed(by: disposeBag)
        
        inNewPageClick
            .filter { $0 > 3 }
            .map { _ in .pop}
            .bind(to: manageOnboarding)
            .disposed(by: disposeBag)
    }
}

enum OnboardingEvent {
    case pop
    case push
}
