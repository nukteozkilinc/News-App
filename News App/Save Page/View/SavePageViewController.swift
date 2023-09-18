//
//  SavePageViewController.swift
//  News App
//
//  Created by Nukte Ozkilinc on 18.09.2023.
//

import UIKit
import RxSwift


class SavePageViewController: UIViewController {
    
    var viewmodel = SavePageViewModel()
    var newsList = [NewsModel]()
    
    
    override func viewDidLoad() {

        super.viewDidLoad()

//        _ = viewmodel.newsList.subscribe(onNext: { liste in
//            self.newsList = liste
//        })
        
        viewmodel.fetchSavedNews()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewmodel.fetchSavedNews()
    }
}
