//
//  OnboardingScreensViewModel.swift
//  OnboardingScreens
//
//  Created by Dmytro Hetman on 01.11.2023.
//

import Foundation
import RxSwift

final class OnboardingScreensViewModel {
    
    private let inActionClick = BehaviorSubject<OnboardingPage>(value: .yourPersonalAssistant)
    
    private let disposeBag = DisposeBag()
    
    var currentPage: OnboardingPage = .upgrageForUnlimitedAICapabilities
    
    init() {
        setupRx()
    }
    
    private func setupRx() {
        
    }
}
