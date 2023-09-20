//
//  UISideMenuViewController.swift
//  News App
//
//  Created by Nukte Ozkilinc on 20.09.2023.
//

import UIKit

protocol SideMenuViewInterface: AnyObject {
  //  func goToMain(identifier: String, selectedCategory: String)
}


class UISideMenuViewController: UIViewController {
    
    @IBOutlet weak var sideMenuTableView: UITableView!
    
    private lazy var viewModel: SideMenuViewModelInterface = SideMenuViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        sideMenuTableView.delegate = self
        sideMenuTableView.dataSource = self
    }
}

extension UISideMenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = sideMenuTableView.dequeueReusableCell(withIdentifier: "SideMenuTableViewCell", for: indexPath) as! SideMenuTableViewCell
        cell.categoryTxt.text = viewModel.categories[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      //  viewModel.category = viewModel.categories[indexPath.row]
    }
  
    
}

extension UISideMenuViewController: SideMenuViewInterface {
//    func goToMain(identifier: String, selectedCategory: String) {
//        performSegue(withIdentifier: identifier, sender: nil)
//    }
//
    
}
