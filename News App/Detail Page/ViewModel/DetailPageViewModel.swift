//
//  DetailPageViewModel.swift
//  News App
//
//  Created by Nukte Ozkilinc on 13.09.2023.
//

import UIKit

protocol DetailPageViewModelInterface {
    var view: DetailPageViewInterface? { get set }
}

class DetailPageViewModel {
    weak var view: DetailPageViewInterface?
}

extension DetailPageViewModel: DetailPageViewModelInterface {
    
}
