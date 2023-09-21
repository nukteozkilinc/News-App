//
//  ProfilePageViewController.swift
//  News App
//
//  Created by Nukte Ozkilinc on 19.09.2023.
//

import UIKit

protocol ProfilePageViewInterface {
    func editRootViewController()
}

final class ProfilePageViewController: UIViewController {
    
    private lazy var viewModel: ProfilePageViewModelInterface = ProfilePageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        
        navigationItem.hidesBackButton = true
    }
    
    @IBAction func pressedChangePassword(_ sender: UIButton) {}
    
    
    @IBAction func pressedLogout(_ sender: UIButton) {
        viewModel.userLogout()
    }
}

extension ProfilePageViewController: ProfilePageViewInterface {
    
    func editRootViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
