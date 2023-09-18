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
    func fetchNews()
    func fetchImages(article: Articles)
    func goToDetailPage()
    func searchNews(search: String)
    func saveNews(selectedNews: Articles?)
}

final class HomePageViewModel {
    weak var view: HomePageViewInterface?
    var articles: [Articles] = []
    var articleDetail: Articles?
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
    func fetchImages(article: Articles){
        //NetworkManager.shared.downloadImage(from: article.urlToImage!)
        
    }
    
    func saveNews(selectedNews: Articles?) {
        //DatabaseManager.shared.saveNews(news: selectedNews!)
        print("KAYDEDILDI")
    }
}
