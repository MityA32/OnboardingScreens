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
    
    func config(from page: OnboardingPage?) {
        guard let page else { return }
        pageCardView.setup(for: page)
        
        contentView.addSubview(pageCardView)
        pageCardView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

}
