//
//  SideMenuViewModel.swift
//  News App
//
//  Created by Nukte Ozkilinc on 20.09.2023.
//

import Foundation

protocol SideMenuViewModelInterface {
    var view: SideMenuViewInterface? { get set }
    var categories: [String] { get set }
    var category: String { get set }
    func selectCategory()
    func goToMainPage()
}

final class SideMenuViewModel {
    weak var view: SideMenuViewInterface?
    var categories: [String] = ["business","entertainment","general","health","science","sports","technology"]
    var category: String = ""
}

extension SideMenuViewModel: SideMenuViewModelInterface {
    
    func selectCategory()  {
        
//        NetworkManager.shared.filterNews(categoryText: category) { responseData in
//            switch responseData {
//            case .success(let news):
//
//            }
//        }
    }
    
    func goToMainPage() {
       // view?.goToMain(identifier: "selectedCategory", selectedCategory: category)
    }
    
}
