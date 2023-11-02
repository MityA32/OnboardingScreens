//
//  SubscriptionService.swift
//  OnboardingScreens
//
//  Created by Dmytro Hetman on 01.11.2023.
//

import Foundation
import StoreKit
import RxSwift

final class InAppPurchaseService: NSObject, SubscriptionServiceProtocol {
    static let productIdentifier = "com.hetman.subscription.monthly"
    
    let outPaymentResult = PublishSubject<Result<Void, PaymentError>>()
    let outRestoreResult = PublishSubject<Result<Void, PaymentError>>()
    
    override init() {
        super.init()
        SKPaymentQueue.default().add(self)
        getProducts()
    }
    
    func getProducts() {
        let products: Set = [InAppPurchaseService.productIdentifier]
        let request = SKProductsRequest(productIdentifiers: products)
        request.delegate = self
        request.start()
    }
    
    func processPayment() -> Observable<Result<Void, PaymentError>> {
        Observable.create { observer in
            switch SKPaymentQueue.canMakePayments() {
                case true:
                    let paymentRequest = SKMutablePayment()
                    paymentRequest.productIdentifier = InAppPurchaseService.productIdentifier
                    SKPaymentQueue.default().add(paymentRequest)
                    
                    observer.onNext(.success(()))
                    observer.onCompleted()
                case false:
                    print("Can't make payments")
                    observer.onNext(.failure(.cantMakePayment))
                    observer.onCompleted()
            }
            
            return Disposables.create { }
        }
    }
    
    func restorePayment() -> Observable<Result<Void, PaymentError>> {
        Observable.create { observer in
            SKPaymentQueue.default().restoreCompletedTransactions()
            observer.onNext(.success(()))
            observer.onCompleted()
            return Disposables.create { }
        }
        
    }
}

extension InAppPurchaseService: SKPaymentTransactionObserver, SKProductsRequestDelegate {
    func request(_ request: SKRequest, didFailWithError error: Error) {
        print(error.localizedDescription)
//        outPaymentResult.onNext(.failure(PaymentError.cantMakePayment))
    }
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        for product in response.products {
            print("Product: \(product)")
        }
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        
        for transaction in transactions {
            switch transaction.transactionState {
                case .purchasing:
                    print("purchasing")
                case .purchased:
                    outPaymentResult.onNext(.success(()))
                    print("purchased")
                case .failed:
                    outPaymentResult.onNext(.failure(PaymentError.cantMakePayment))
                    print("failed")
                case .restored:
                    outRestoreResult.onNext(.success(()))
                    print("restored")
                case .deferred:
                    print("deferred")
                @unknown default:
                    print("unknown")
            }
        }
        
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, restoreCompletedTransactionsFailedWithError error: Error) {
        print(error.localizedDescription)
        outRestoreResult.onNext(.failure(.cantRestore))
    }
    
    func paymentQueueRestoreCompletedTransactionsFinished(_ queue: SKPaymentQueue) {
        for transaction in queue.transactions {
            let productID = transaction.payment.productIdentifier as String

            switch productID {
                case InAppPurchaseService.productIdentifier:
                        outRestoreResult.onNext(.success(()))

                default:
                    outRestoreResult.onNext(.failure(.productNotFound))
            }
        }
    }
}
