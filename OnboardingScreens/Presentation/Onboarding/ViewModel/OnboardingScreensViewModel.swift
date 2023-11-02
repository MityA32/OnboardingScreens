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
    
    let inNewPageClick = PublishSubject<Void>()
    let inCloseClick = PublishSubject<Void>()
    let inRestorePurchaseClick = PublishSubject<Void>()
    
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
            .withLatestFrom(currentPage)
            .filter { [weak self] in $0?.number ?? 0 < self?.pages.count ?? 0 }
            .map { [weak self] page -> OnboardingPageInfo? in
                guard let self, let page else { return nil }
                return OnboardingPageInfo(self.pages[page.number + 1], page.number + 1)
            }
            .bind(to: currentPage)
            .disposed(by: disposeBag)
        
        inNewPageClick
            .withLatestFrom(currentPage)
            .filter { $0?.number ?? 0 > 3 }
            .map { _ in .pop}
            .bind(to: manageOnboarding)
            .disposed(by: disposeBag)
        
        inCloseClick
            .map { _ in .pop }
            .bind(to: manageOnboarding)
            .disposed(by: disposeBag)
        
        inRestorePurchaseClick
            .bind { [weak self] in
                self?.subscriptionService.processTransaction()
            }
            .disposed(by: disposeBag)
    }
}
