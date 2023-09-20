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
    var newsList: [Articles] = []
    
    
    @IBOutlet weak var btnSave: UIButton! {
        didSet {
            btnSave.setImage(UIImage(named: "heart"), for: .normal)
        }
    }
    
    @IBOutlet weak var imgNewsDetail: UIImageView! {
        didSet {
            if let urlToImage = article!.urlToImage {
                 //let url = URL(string: urlToImage)
                        DispatchQueue.global().async {
                            if let data = try? Data(contentsOf: urlToImage) {
                                DispatchQueue.main.async {
                                    self.imgNewsDetail.image = UIImage(data: data)
                                }
                            }
                        }
                    }
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
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        DatabaseManager.shared.fetchSavedNews(){ [self] response in
            switch response {
            case .success(let news):
                newsList = news
            case .failure(_):
                break
            }
        }
        
        for savedNews in newsList {
            if savedNews.title == article?.title {
                article?.isLiked = true
            }else {
                article?.isLiked = false
            }
        }
    }
    
    @IBAction func pressedSave(_ sender: UIButton) {
        
        if article?.isLiked == false || article?.isLiked == nil {
            btnSave.setImage(UIImage(named: "heart.fill"), for: .normal)
            article?.isLiked = true
            viewModel.savedNews(article: article)
        } else {
            btnSave.setImage(UIImage(named: "heart"), for: .normal)
            article?.isLiked = false
            viewModel.deleteNews(article: article)
        }
        
    }
    
}

extension DetailPageViewController: DetailPageViewInterface {
    
}
