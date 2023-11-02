//
//  ObservableType+Extension.swift
//  OnboardingScreens
//
//  Created by Dmytro Hetman on 02.11.2023.
//

import RxSwift

extension ObservableType {
    func mapToVoid() -> Observable<Void> {
        map { _ in }
    }
}
