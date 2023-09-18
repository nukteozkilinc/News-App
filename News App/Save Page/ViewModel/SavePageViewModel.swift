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
    var newsList: [Articles] { get set }
}


class SavePageViewModel {
    
    //var newsList = BehaviorSubject<[NewsModel]>(value: [NewsModel]())
    var newsList: [Articles] = []
}

extension SavePageViewModel: SavePageViewModelInterface {
    func fetchSavedNews() {
        DatabaseManager.shared.fetchSavedNews() { responseData in
            switch responseData {
            case .success(let news):
                self.newsList.append(news)
            case .failure(_):
                break
            }
        }
        print("BURASI")
        print(newsList)
    }
    
    
}
