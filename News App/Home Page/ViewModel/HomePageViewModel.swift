//
//  HomePageViewModel.swift
//  News App
//
//  Created by Nukte Ozkilinc on 11.09.2023.
//

import UIKit

protocol HomePageViewModelInterface{
    var view: HomePageViewInterface? { get set }
    var articles: [Articles] { get set }
    var articleDetail: Articles? { get set }
    var categorySide: Bool { get set }
    
    func fetchNews()
    func fetchImages(url : URL, completion: ((UIImage?) -> Void)?)
    func goToDetailPage()
    func searchNews(search: String)
    func filterNews(category: String)
    func manageMenu()
}

final class HomePageViewModel {
    weak var view: HomePageViewInterface?
    var articles: [Articles] = []
    var articleDetail: Articles?
    var categorySide: Bool = false
}

extension HomePageViewModel: HomePageViewModelInterface {
    
    func searchNews(search: String) {
        NetworkManager.shared.searchNews(searchText: search) { [weak self]
            responseData in
            switch responseData {
            case .success(let news):
                if let new = news.articles {
                    self?.articles = new
                    self?.view?.reloadTableView()
                }
            case .failure(_):
                break
            }
        }
    }
    
    
    func goToDetailPage() {
        view?.goToDetailPage(identifier: "goToDetail", selectedArticle: articleDetail!)
    }
    
    func fetchNews() {
        NetworkManager.shared.getNews{ [weak self] responseData in
            switch responseData {
            case .success(let news):
                if let new = news.articles {
                    self?.articles = new
                    self?.view?.reloadTableView()
                }
            case .failure(_):
                break
            }
        }
    }
    
    func filterNews(category: String) {
        NetworkManager.shared.filterNews(categoryText: category) { [weak self]
            responseData in
            switch responseData {
            case .success(let news):
                if let new = news.articles {
                    self?.articles = new
                    self?.view?.reloadTableView()
                }
            case .failure(_):
                break
            }
        }
    }
    
    func fetchImages(url : URL, completion: ((UIImage?) -> Void)?) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    completion?(image)
                }
            }
        }
    }
    
    func manageMenu() {
        view?.manageMenuSize(categorySide: categorySide)
        categorySide = !categorySide
    }
}
