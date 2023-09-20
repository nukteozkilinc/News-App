//
//  SavePageViewController.swift
//  News App
//
//  Created by Nukte Ozkilinc on 18.09.2023.
//

import UIKit

protocol SavePageViewInterface: AnyObject {
    func reloadSaveTableView()
}


class SavePageViewController: UIViewController {
    
    private lazy var viewmodel: SavePageViewModelInterface = SavePageViewModel()

    @IBOutlet weak var savedNewsTableView: UITableView! {
        didSet {
            savedNewsTableView.delegate = self
            savedNewsTableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {

        super.viewDidLoad()
//        _ = viewmodel.newsList.subscribe(onNext: { liste in
//            self.newsList = liste
//        })
        
        navigationItem.rightBarButtonItem?.isHidden = true
        viewmodel.view = self
        viewmodel.fetchSavedNews()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewmodel.fetchSavedNews()
    }
}


extension SavePageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewmodel.newsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = savedNewsTableView.dequeueReusableCell(withIdentifier: "SavePageTableViewCell", for: indexPath) as! SavePageTableViewCell
        
        cell.lblSavedTitle.text = viewmodel.newsList[indexPath.row].title
        cell.lblSavedDescription.text = viewmodel.newsList[indexPath.row].description
        return cell
    }
    
    
}

extension SavePageViewController: SavePageViewInterface {
    func reloadSaveTableView() {
        savedNewsTableView.reloadData()
    }
    
    
}
