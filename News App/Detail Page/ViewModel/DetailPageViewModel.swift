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
    func fetchDetailImage(url: URL, completion: ((UIImage?) -> Void)?)
}

class DetailPageViewModel {
    weak var view: DetailPageViewInterface?
}

extension DetailPageViewModel: DetailPageViewModelInterface {
    func deleteNews(article: Articles?) {
        DatabaseManager.shared.deleteNews(news: article!)
    }
    
    func savedNews(article: Articles?) {
        
        //MARK: Optionallari duzelt
        DatabaseManager.shared.saveNews(author: (article?.author)!, content: (article?.content)!, description: (article?.description)!, publishedAt: (article?.publishedAt)!, title: (article?.title)!, urlToImage: (article?.urlToImage)!)
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
}
