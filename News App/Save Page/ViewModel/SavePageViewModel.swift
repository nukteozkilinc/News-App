//
//  SavePageViewModel.swift
//  News App
//
//  Created by Nukte Ozkilinc on 18.09.2023.
//

import UIKit

protocol SavePageViewModelInterface {
    var view: SavePageViewInterface? { get set }
    var newsList: [Articles] { get set }
    
    func fetchSavedNews()
    func fetchImages(url : URL, completion: ((UIImage?) -> Void)?)
}

final class SavePageViewModel {
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
}
