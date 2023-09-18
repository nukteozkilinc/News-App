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
        slides = [OnboardingSlide(title: "WELCOME!", description: "Haber uygulamasina hosgeldiniz.", image: UIImage(named: "news-reporter")!),OnboardingSlide(title: "GUNCEL HABERLER", description: "Burada guncel haberleri aninda cebinizde sahip olabilirsiniz.", image: UIImage(named: "update-news")!),OnboardingSlide(title: "KAYDET", description: "Kaydedilen haberleri daha sonra istediginizde tekrar ulasabilirsiniz.", image: UIImage(named: "click-save")!),OnboardingSlide(title: "ARAMA&KATEGORI", description: "Guncel haberler icerisinde arama ve katagori kismi ile haberlerinizi guncellestirebilirsiniz!", image: UIImage(named: "search-filter")!)]
    }
    
    func viewDidLoad() {
        view?.prepareCollectionView()
    }
}
