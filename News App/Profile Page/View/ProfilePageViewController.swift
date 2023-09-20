//
//  ProfilePageViewController.swift
//  News App
//
//  Created by Nukte Ozkilinc on 19.09.2023.
//

import UIKit

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
        self.navigationController?.popToRootViewController(animated: true)
    }
}
