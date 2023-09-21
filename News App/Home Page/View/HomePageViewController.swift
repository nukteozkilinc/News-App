//
//  HomePageViewController.swift
//  News App
//
//  Created by Nukte Ozkilinc on 11.09.2023.
//

import UIKit

protocol HomePageViewInterface: AnyObject {
    func reloadTableView()
    func goToDetailPage(identifier: String, selectedArticle: Articles)
    func manageMenuSize(categorySide: Bool)
}

class HomePageViewController: UIViewController{
    
    private lazy var viewModel:HomePageViewModelInterface = HomePageViewModel()
    
    @IBOutlet weak var trailingOfView: NSLayoutConstraint!
    
    @IBOutlet weak var newsTableView: UITableView! {
        didSet {
            newsTableView.delegate = self
            newsTableView.dataSource = self
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.fetchNews()
    }
    
    @IBAction func pressedFilter(_ sender: UIBarButtonItem) {
        viewModel.manageMenu()
    }
    
    @IBAction func pressedGeneral(_ sender: UIButton) {
        viewModel.filterNews(category: "general")
    }
    
    @IBAction func pressedBusiness(_ sender: UIButton) {
        viewModel.filterNews(category: "business")
    }
}

extension HomePageViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomePageTableViewCell", for: indexPath) as! HomePageTableViewCell
        
        cell.lblTitle.text = viewModel.articles[indexPath.row].title
        cell.lblDescription.text = viewModel.articles[indexPath.row].description
        
        if let urlToImage = viewModel.articles[indexPath.row].urlToImage {
            viewModel.fetchImages(url: urlToImage) { img in
                cell.imgNew.image = img
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        newsTableView.deselectRow(at: indexPath, animated: true)
        
        viewModel.articleDetail = viewModel.articles[indexPath.row]
        viewModel.goToDetailPage()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetail" {
            if let destinationVC = segue.destination as? DetailPageViewController{
                destinationVC.article = viewModel.articleDetail
            }
        }
    }
}


extension HomePageViewController: HomePageViewInterface{
    func goToDetailPage(identifier: String, selectedArticle: Articles) {
        performSegue(withIdentifier: identifier, sender: nil)
    }
    
    func reloadTableView() {
        newsTableView.reloadData()
    }
    
    func manageMenuSize(categorySide: Bool) {
        if (categorySide) {
            trailingOfView.constant = 393
            UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveEaseIn, animations: {
                self.view.layoutIfNeeded()
            })
        } else {
            trailingOfView.constant = 0
        }
    }
}

extension HomePageViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchNews(search: searchText)
    }
}
