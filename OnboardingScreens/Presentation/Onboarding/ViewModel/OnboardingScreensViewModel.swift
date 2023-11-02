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
    
    private let disposeBag = DisposeBag()
    
    let pages = OnboardingPage.allCases
    
    init() {
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
    }
}

struct OnboardingPageInfo {
    let onboardingPage: OnboardingPage
    let number: Int
    
    init(_ onboardingPage: OnboardingPage, _ number: Int) {
        self.onboardingPage = onboardingPage
        self.number = number
    }
}
