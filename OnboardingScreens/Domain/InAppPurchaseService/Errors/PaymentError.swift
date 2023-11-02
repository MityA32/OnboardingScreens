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

extension PaymentError {
    var title: String {
        switch self {
            case .cantMakePayment:
                return "PaymentError: Can't make payment"
            case .cantRestore:
                return "PaymentError: Can't restore"
            case .productNotFound:
                return "PaymentError: Product not found"
        }
    }
}
