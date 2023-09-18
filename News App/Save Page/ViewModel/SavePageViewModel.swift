//
//  SavePageViewModel.swift
//  News App
//
//  Created by Nukte Ozkilinc on 18.09.2023.
//

import Foundation
import RxSwift

protocol SavePageViewModelInterface {
    func fetchSavedNews()
}


class SavePageViewModel {
    
    var newsList = BehaviorSubject<[NewsModel]>(value: [NewsModel]())
}

extension SavePageViewModel: SavePageViewModelInterface {
    func fetchSavedNews() {
        DatabaseManager.shared.fetchSavedNews()
    }
    
    
}
