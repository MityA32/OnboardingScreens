//
//  SubscriptionServiceProtocol.swift
//  OnboardingScreens
//
//  Created by Dmytro Hetman on 02.11.2023.
//

import RxSwift

protocol SubscriptionServiceProtocol {
    var outPaymentResultObservable: Observable<Result<Void, PaymentError>> { get }
    var outRestoreResultObservable: Observable<Result<Void, PaymentError>> { get }
    func processPayment() -> Single<Void>
    func restorePayment() -> Observable<Result<Void, PaymentError>>
}
