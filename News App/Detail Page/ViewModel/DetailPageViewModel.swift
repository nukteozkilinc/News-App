//
//  DetailPageViewModel.swift
//  News App
//
//  Created by Nukte Ozkilinc on 13.09.2023.
//

import UIKit

protocol DetailPageViewModelInterface {
    var view: DetailPageViewInterface? { get set }
    func savedNews()
}

class DetailPageViewModel {
    weak var view: DetailPageViewInterface?
}

extension DetailPageViewModel: DetailPageViewModelInterface {
    func savedNews() {
            DatabaseManager.shared.saveNews(author: "news.author", content: "news.content", description: "news.description", isLiked: true, publishedAt: "news.publishedAt", title: "news.title")
    }
    
    
}
