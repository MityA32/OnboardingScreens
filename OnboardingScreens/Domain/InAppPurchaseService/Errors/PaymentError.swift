//
//  PaymentError.swift
//  OnboardingScreens
//
//  Created by Dmytro Hetman on 02.11.2023.
//

import Foundation

enum PaymentError: Error {
    case cantMakePayment
    case cantRestore
    case productNotFound
}
