//
//  DetailPageViewController.swift
//  News App
//
//  Created by Nukte Ozkilinc on 13.09.2023.
//

import UIKit

protocol DetailPageViewInterface: AnyObject {
    
}

class DetailPageViewController: UIViewController {
    
    lazy var viewModel: DetailPageViewModelInterface = DetailPageViewModel()
    var article: Articles?
    
    @IBOutlet weak var imgNewsDetail: UIImageView! {
        didSet {
            
        }
    }
    @IBOutlet weak var lblNewsDetailTitle: UILabel! {
        didSet {
            lblNewsDetailTitle.text = article?.title
        }
    }
    
    @IBOutlet weak var lblNewsDetailContent: UILabel! {
        didSet {
            lblNewsDetailContent.text = article?.content
        }
    }
    @IBOutlet weak var lblNewsDetailAuthor: UILabel! {
        didSet {
            lblNewsDetailAuthor.text = article?.author
        }
    }
    
    @IBOutlet weak var lblNewsDetailDate: UILabel! {
        didSet {
            lblNewsDetailDate.text = article?.publishedAt
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
    }
    
    @IBAction func pressedSave(_ sender: UIButton) {
        viewModel.savedNews(article: article)
    }
    
}

extension DetailPageViewController: DetailPageViewInterface {
    
}
