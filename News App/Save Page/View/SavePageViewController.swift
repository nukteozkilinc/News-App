//
//  SavePageViewController.swift
//  News App
//
//  Created by Nukte Ozkilinc on 18.09.2023.
//

import UIKit
import RxSwift


class SavePageViewController: UIViewController {
    
    var viewmodel: SavePageViewModelInterface? = SavePageViewModel()
    var newsListesi = BehaviorSubject<[Articles]>(value: [Articles]())
    
    override func viewDidLoad() {

        super.viewDidLoad()
        veritabaniKopyala()
        newsListesi = DatabaseManager.shared.newsList
    }
    
    override func viewWillAppear(_ animated: Bool) {
       // viewmodel?.fetchSavedNews()
        DatabaseManager.shared.fetchSavedNews()
    }
    
    func veritabaniKopyala(){
        let bundleYolu = Bundle.main.path(forResource: "news", ofType: ".sqlite")
        
        let dosyaYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: dosyaYolu).appendingPathComponent("news.sqlite")
        
        let fm = FileManager.default
        
        if fm.fileExists(atPath: veritabaniURL.path()){
            print("Veritabani zaten var.")
        }else{
            do{
                try fm.copyItem(atPath: bundleYolu!, toPath: veritabaniURL.path)
            }catch{
                print(error.localizedDescription)
            }
        }
    }
}
