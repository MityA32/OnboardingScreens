//
//  OnboardingPageCollectionViewCell.swift
//  OnboardingScreens
//
//  Created by Dmytro Hetman on 01.11.2023.
//

import UIKit

final class OnboardingPageCollectionViewCell: UICollectionViewCell {
    static let id = "\(OnboardingPageCollectionViewCell.self)"
    
    private var pageCardView = OnboardingCardView()
    
    func config(from type: OnboardingPage) {
        pageCardView.setup(for: type)
        
        contentView.addSubview(pageCardView)
        pageCardView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

}
