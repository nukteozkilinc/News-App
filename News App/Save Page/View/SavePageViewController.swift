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
        
        navigationItem.rightBarButtonItem?.isHidden = true
        viewmodel.view = self
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
        
        if let urlToImg = viewmodel.newsList[indexPath.row].urlToImage {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: urlToImg) {
                    DispatchQueue.main.async {
                        cell.imgSaved.image = UIImage(data: data)
                    }
                }
            }
        }
        return cell
    }
}

extension SavePageViewController: SavePageViewInterface {
    func reloadSaveTableView() {
        savedNewsTableView.reloadData()
    }
}
