//
//  OnboardingPageInfo.swift
//  OnboardingScreens
//
//  Created by Dmytro Hetman on 02.11.2023.
//

import Foundation

struct OnboardingPageInfo {
    let onboardingPage: OnboardingPage
    let number: Int
    
    init(_ onboardingPage: OnboardingPage, _ number: Int) {
        self.onboardingPage = onboardingPage
        self.number = number
    }
}
