//
//  AppCoordinator.swift
//  OnboardingScreens
//
//  Created by Dmytro Hetman on 02.11.2023.
//

import UIKit
import RxSwift

final class AppCoordinator: Coordinator {
    private var window = UIWindow(frame: UIScreen.main.bounds)
    var navigationController = UINavigationController()
    
    let disposeBag = DisposeBag()
    
    init() {
        navigationController.navigationBar.isHidden = true
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func start() {
        showOnboarding()
    }
    
    private func showOnboarding() {
        
        let onboardingViewModel = OnboardingScreensViewModel(subscriptionService: SubscriptionService())
        let onboardingViewController = OnboardingScreensViewController()
        onboardingViewController.viewModel = onboardingViewModel
        
        onboardingViewModel.manageOnboarding
            .bind { [weak self] in
                switch $0 {
                    case .pop:
                        self?.navigationController.viewControllers = []
                        print("Close Onboarding")
                    case .push:
                        print("Push to next")
                }
                
            }
            .disposed(by: onboardingViewModel.disposeBag)
        
        navigationController.viewControllers = [onboardingViewController]
    }
    
    
}
