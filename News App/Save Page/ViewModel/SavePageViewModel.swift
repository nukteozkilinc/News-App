//
//  SavePageViewModel.swift
//  News App
//
//  Created by Nukte Ozkilinc on 18.09.2023.
//

import Foundation
import UIKit

protocol SavePageViewModelInterface {
    var view: SavePageViewInterface? { get set }
    func fetchSavedNews()
    var newsList: [Articles] { get set }
}


class SavePageViewModel {
    var view: SavePageViewInterface?
    var newsList: [Articles] = []
}

extension SavePageViewModel: SavePageViewModelInterface {
    func fetchSavedNews() {
        newsList = []
        
        DatabaseManager.shared.fetchSavedNews() { responseData in
            switch responseData {
            case .success(let news):
                self.newsList = news
                self.view?.reloadSaveTableView()
            case .failure(_):
                break
            }
        }
    }
}
