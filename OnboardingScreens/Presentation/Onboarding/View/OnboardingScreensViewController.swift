//
//  ViewController.swift
//  OnboardingScreens
//
//  Created by Dmytro Hetman on 31.10.2023.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

final class OnboardingScreensViewController: UIViewController {

    private let backgroundImageView = UIImageView()
    private let termsLabel = UITextView()
    private let actionButton = UIButton()
    private var onboardingCardsCollectionView: UICollectionView?
    private let pageControlImageView = UIImageView()
    
    private let disposeBag = DisposeBag()
    
    var viewModel: OnboardingScreensViewModel? {
        didSet {
            setup()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        actionButton.layer.cornerRadius = actionButton.frame.height / 2
    }

    private func setup() {
        setupBackground()
        setupTermsLabel()
        setupActionButton()
        setupOnboardingCardsCollectionView()
        setupRx()
    }
    
    private func setupBackground() {
        backgroundImageView.image = AssetImage.onboardingBackgroundDark
        view.addSubview(backgroundImageView)
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setupTermsLabel() {
        termsLabel.attributedText = Parameters.OnboardingPage.TermsLabel.attributedText
        termsLabel.textAlignment = .center
        termsLabel.delegate = self
        termsLabel.isEditable = false
        termsLabel.isScrollEnabled = false
        termsLabel.backgroundColor = .clear
        termsLabel.isSelectable = true
        termsLabel.textContainer.lineFragmentPadding = 0
        termsLabel.textContainerInset = .zero
        view.addSubview(termsLabel)
        
        termsLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.left.right.equalToSuperview().inset(36)
            $0.height.equalTo(28)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    private func setupActionButton() {
        actionButton.backgroundColor = .white
          
        view.addSubview(actionButton)
        actionButton.snp.makeConstraints {
            $0.height.equalTo(56)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(52)
            $0.left.right.equalToSuperview().inset(30)
        }
    }

    private func setupOnboardingCardsCollectionView() {
        let carouselLayout = UICollectionViewFlowLayout()
        carouselLayout.scrollDirection = .horizontal
        carouselLayout.minimumInteritemSpacing = 16
        carouselLayout.sectionInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        onboardingCardsCollectionView = UICollectionView(frame: view.frame, collectionViewLayout: carouselLayout)
        
        guard let onboardingCardsCollectionView else { return }
        onboardingCardsCollectionView.isScrollEnabled = false
        onboardingCardsCollectionView.backgroundColor = .clear
        onboardingCardsCollectionView.showsHorizontalScrollIndicator = false
        onboardingCardsCollectionView.dataSource = self
        onboardingCardsCollectionView.delegate = self
        onboardingCardsCollectionView.register(
            OnboardingPageCollectionViewCell.self,
            forCellWithReuseIdentifier: OnboardingPageCollectionViewCell.id)
        
        view.addSubview(onboardingCardsCollectionView)
        onboardingCardsCollectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(56)
            $0.left.right.equalToSuperview()
            $0.bottom.equalTo(actionButton.snp.top).inset(-28)
        }
        
        onboardingCardsCollectionView.setNeedsLayout()
    }
    
    private func setupRx() {
        guard let viewModel else { return }
        viewModel.currentPage
            .bind { [weak self] page in
                guard let page else { return }
                self?.setupPage(page)
            }
            .disposed(by: disposeBag)
        
        actionButton.rx.tap
            .map { [weak self] in
                print((self?.viewModel?.inNewPageClick.value ?? 0) + 1)
                return (self?.viewModel?.inNewPageClick.value ?? 0) + 1
            }
            .bind(to: viewModel.inNewPageClick)
            .disposed(by: disposeBag)
    }
    
    private func setupPage(_ page: OnboardingPageInfo) {
        onboardingCardsCollectionView?.scrollToItem(
            at: IndexPath(item: page.number, section: 0),
            at: .centeredHorizontally,
            animated: true)
        
        actionButton.setAttributedTitle(
            page.onboardingPage.actionButtonText.title,
            for: .normal)
        
        switch page.onboardingPage {
            case .yourPersonalAssistant:
                break
            
            case .getAssistanceWithAnyTopic:
                termsLabel.isHidden = true
                setupPageControlImageView()
                
            case .perfectCopyYouCanRelyOn:
                pageControlImageView.image = Parameters.OnboardingPage.iconThirdPageControl
            
            case .upgrageForUnlimitedAICapabilities:
                setupSubscriptionManagerBarView()
                pageControlImageView.removeFromSuperview()
                termsLabel.isHidden = false
        }
    }
    
    private func setupSubscriptionManagerBarView() {
        let subscriptionManagerBarView = SubscriptionManagerBarView()
        
        view.addSubview(subscriptionManagerBarView)
        subscriptionManagerBarView.snp.makeConstraints {
            $0.height.equalTo(44)
            $0.left.right.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
    }
    
    private func setupPageControlImageView() {
        pageControlImageView.image = Parameters.OnboardingPage.iconSecondPageControl
        pageControlImageView.contentMode = .scaleAspectFit
        
        view.addSubview(pageControlImageView)
        pageControlImageView.snp.makeConstraints {
            $0.centerX.equalTo(view.snp.centerX)
            $0.width.equalTo(91)
            $0.height.equalTo(4)
            $0.top.equalTo(actionButton.snp.bottom).inset(-32)
        }
    }
}

extension OnboardingScreensViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
        UIApplication.shared.open(URL)
        return false
    }
}

extension OnboardingScreensViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.pages.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = onboardingCardsCollectionView?.dequeueReusableCell(withReuseIdentifier: OnboardingPageCollectionViewCell.id, for: indexPath) as! OnboardingPageCollectionViewCell
        cell.config(from: viewModel?.pages[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.bounds.width - 60, height: collectionView.bounds.height)
    }
    
}
