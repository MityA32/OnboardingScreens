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
    let manageOnboarding = PublishSubject<OnboardingEvent>()
    let currentPage = BehaviorRelay<OnboardingPageInfo?>(value: OnboardingPageInfo(.yourPersonalAssistant, 0))
    
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
            .filter { [weak self] in $0?.number ?? 0 < (self?.pages.count ?? 0) - 1 }
            .map { [weak self] page -> OnboardingPageInfo? in
                guard let self, let page else { return nil }
                return OnboardingPageInfo(self.pages[page.number + 1], page.number + 1)
            }
            .bind(to: currentPage)
            .disposed(by: disposeBag)
        
        let payment = inNewPageClick
            .withLatestFrom(currentPage)
            .filter { $0?.number ?? 0 == 3 }
            .skip(1)
            .flatMap { [weak self] _ in
                self?.subscriptionService.processPayment() ?? .empty()
            }
            .flatMapLatest { [weak self] res in
                self?.subscriptionService.outPaymentResult ?? .empty()
            }
        let restore = inRestorePurchaseClick
            .flatMap { [weak self] _ in
                self?.subscriptionService.restorePayment() ?? .empty()
            }
            .flatMapLatest { [weak self] res in
                self?.subscriptionService.outRestoreResult ?? .empty()
            }
        
        Observable
            .merge(payment, restore)
            .map {
                switch $0 {
                    case .success(_):
                        return .pop
                    case .failure(_):
                        return .paymentFailed
                }
            }
            .bind(to: manageOnboarding)
            .disposed(by: disposeBag)
        
        inCloseClick
            .map { _ in .pop }
            .bind(to: manageOnboarding)
            .disposed(by: disposeBag)
        
    }
}
