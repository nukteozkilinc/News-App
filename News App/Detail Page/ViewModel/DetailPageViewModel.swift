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
}

class DetailPageViewModel {
    weak var view: DetailPageViewInterface?
}

extension DetailPageViewModel: DetailPageViewModelInterface {
    func deleteNews(article: Articles?) {
        //article?.isLiked = true
        DatabaseManager.shared.deleteNews(news: article!)
    }
    
    func savedNews(article: Articles?) {
        DatabaseManager.shared.saveNews(author: (article?.author)!, content: (article?.content)!, description: (article?.description)!, publishedAt: (article?.publishedAt)!, title: (article?.title)!)
    }
    
}
