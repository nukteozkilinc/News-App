//
//  OnboardingViewModel.swift
//  News App
//
//  Created by Nukte Ozkilinc on 7.09.2023.
//

import UIKit

protocol OnboardingViewModelInterface{
    var view: OnboardingViewInterface? { get set }
    var slides: [OnboardingSlide] { get set }
    func viewDidLoad()
    
    func fetchData()
    func swipeSlide(swipeRight: Int?)
    func goToNextPage()
}

final class OnboardingViewModel {
    weak var view: OnboardingViewInterface?
    var slides: [OnboardingSlide] = []
    private var currentPage = 0
}

extension OnboardingViewModel: OnboardingViewModelInterface{
    func goToNextPage() {
        if currentPage == slides.count - 1{
            view?.goToLogin(identifier: "goToLogin")
        } else {
            swipeSlide()
        }
    }
    
    func swipeSlide(swipeRight: Int? = nil) {
        currentPage += 1
        if let swipeRight = swipeRight{
            currentPage = swipeRight
        }
        if currentPage == slides.count - 1 {
            view?.handleOutput(title: "Get Started", currentPage: currentPage)
        } else {
            view?.handleOutput(title: "Next", currentPage: currentPage)
        }
    }
    
    
    func fetchData() {
        slides = [OnboardingSlide(title: "WELCOME!", description: "Welcome to the NewsPulse.", image: UIImage(named: "news-reporter")!),OnboardingSlide(title: "LATEST NEWS", description: "Here you can have the latest news instantly in your pocket.", image: UIImage(named: "update-news")!),OnboardingSlide(title: "SAVE", description: "You can access the saved news later whenever you want.", image: UIImage(named: "click-save")!),OnboardingSlide(title: "SEARCH&FILTER", description: "You can update your news with the search and category sections within the current news!", image: UIImage(named: "search-filter")!)]
    }
    
    func viewDidLoad() {
        view?.prepareCollectionView()
    }
}
