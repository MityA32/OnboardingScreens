//
//  SubscriptionServiceProtocol.swift
//  OnboardingScreens
//
//  Created by Dmytro Hetman on 02.11.2023.
//

import RxSwift

protocol SubscriptionServiceProtocol {
    var outPaymentResult: PublishSubject<Result<Void, PaymentError>> { get }
    var outRestoreResult: PublishSubject<Result<Void, PaymentError>> { get }
    func processPayment() -> Observable<Result<Void, PaymentError>>
    func restorePayment() -> Observable<Result<Void, PaymentError>>
}
