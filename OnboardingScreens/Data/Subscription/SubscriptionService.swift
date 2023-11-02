//
//  SubscriptionService.swift
//  OnboardingScreens
//
//  Created by Dmytro Hetman on 01.11.2023.
//

import Foundation
import StoreKit

final class SubscriptionService: SubscriptionServiceProtocol {
    
    func processTransaction() {
        print("processing transaction...")
    }
    
}

protocol SubscriptionServiceProtocol {
    func processTransaction()
}
