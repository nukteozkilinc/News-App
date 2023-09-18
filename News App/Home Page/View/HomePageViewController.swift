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
}

class HomePageViewController: UIViewController{
    
    private lazy var viewModel:HomePageViewModelInterface = HomePageViewModel()
    
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
}

extension HomePageViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomePageTableViewCell", for: indexPath) as! HomePageTableViewCell
        
        cell.lblTitle.text = viewModel.articles[indexPath.row].title
        cell.lblDescription.text = viewModel.articles[indexPath.row].description
        //cell.imgNew.image = UIImage(data: viewModel.fetchImages(article: viewModel.articles[indexPath.row]))
        //viewModel.fetchImages(article: viewModel.articles[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
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
}

extension HomePageViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchNews(search: searchText)
    }
}
