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
}

class DetailPageViewModel {
    weak var view: DetailPageViewInterface?
}

extension DetailPageViewModel: DetailPageViewModelInterface {
    func savedNews(article: Articles?) {
        DatabaseManager.shared.saveNews(author: (article?.author)!, content: (article?.content)!, description: (article?.description)!, isLiked: true, publishedAt: (article?.publishedAt)!, title: (article?.title)!)
    }
    
    
}
