//
//  DetailPageViewModel.swift
//  News App
//
//  Created by Nukte Ozkilinc on 13.09.2023.
//

import UIKit

protocol DetailPageViewModelInterface {
    var view: DetailPageViewInterface? { get set }
    func savedNews(article: Articles?)
    func deleteNews(article: Articles?)
    func setImage()
    func checkSavedNews(savedNews: Articles?)
    func fetchDetailImage(url: URL, completion: ((UIImage?) -> Void)?)
}

final class DetailPageViewModel {
    weak var view: DetailPageViewInterface?
}

extension DetailPageViewModel: DetailPageViewModelInterface {
    func deleteNews(article: Articles?) {
        DatabaseManager.shared.deleteNews(news: (view?.article!)!)
    }
    
    func savedNews(article: Articles?) {
        
        if let savedArticle = view?.article {
            DatabaseManager.shared.saveNews(author: savedArticle.author ?? "Removed", content: savedArticle.content ?? "Removed", description: savedArticle.description ?? "Removed", publishedAt: savedArticle.publishedAt ?? "Removed", title: savedArticle.title ?? "Removed", urlToImage: (savedArticle.urlToImage ?? URL(string: "https://cdn.w600.comps.canstockphoto.com/removed-rubber-stamp-vector-clipart_csp43352204.jpg"))!)
        }
    }
    
    func fetchDetailImage(url: URL, completion: ((UIImage?) -> Void)?) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    completion?(image)
                }
            }
        }
    }
    
    func setImage() {
        
        if view?.article?.isLiked == false || view?.article?.isLiked == nil {
            view?.resizeImage(imageName: "saved")
            view?.article?.isLiked = true
            savedNews(article: view?.article)
        } else {
            view?.resizeImage(imageName: "unsaved")
            view?.article?.isLiked = false
            deleteNews(article: view?.article)
        }
        
        print("--PRESSED NEWS----")
        print(view?.article?.isLiked)
    }
    
    func checkSavedNews(savedNews: Articles?) {
        if savedNews?.title == view?.article?.title {
            view?.article?.isLiked = true
            view?.resizeImage(imageName: "saved")
        }else {
            view?.article?.isLiked = false
            view?.resizeImage(imageName: "unsaved")
        }
        print("--CHECK NEWS----")
        print(view?.article?.isLiked)
    }
}
