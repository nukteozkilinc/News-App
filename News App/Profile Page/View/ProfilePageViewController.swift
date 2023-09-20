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
        
        navigationItem.hidesBackButton = true
    }
    
    
    @IBAction func pressedChangePassword(_ sender: UIButton) {
        
    }
    
    
    @IBAction func pressedLogout(_ sender: UIButton) {
        viewModel.userLogout()
        viewModel.goToLogin()
        self.navigationController?.popToRootViewController(animated: true)
    }
}

extension ProfilePageViewController: ProfilePageViewInterface {
    func editRootViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let viewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        UIApplication.shared.windows.first?.rootViewController = viewController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
        
    }
}
