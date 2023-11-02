//
//  OnboardingEvent.swift
//  OnboardingScreens
//
//  Created by Dmytro Hetman on 02.11.2023.
//

import Foundation

enum OnboardingEvent {
    case pop
    case push
    case paymentFailed(error: PaymentError)
}
