//
//  DetailPageViewController.swift
//  News App
//
//  Created by Nukte Ozkilinc on 13.09.2023.
//

import UIKit

protocol DetailPageViewInterface: AnyObject {
    
    var article: Articles? { get set }
    
    func resizeImage(imageName: String)
}

class DetailPageViewController: UIViewController {
    
    lazy var viewModel: DetailPageViewModelInterface = DetailPageViewModel()
    var article: Articles?
    var newsList: [Articles] = []
    
    
    @IBOutlet weak var btnSave: UIButton!
    
    @IBOutlet weak var imgNewsDetail: UIImageView! {
        didSet {
            if let image = article?.urlToImage {
                viewModel.fetchDetailImage(url: image) { [self] img in
                    imgNewsDetail.image = img
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
            viewModel.checkSavedNews(savedNews: savedNews)
        }
    }
    
    @IBAction func pressedSave(_ sender: UIButton) {
        viewModel.setImage()
    }
}

extension DetailPageViewController: DetailPageViewInterface {
    
    func resizeImage(imageName: String) {
        if let originalImage = UIImage(named: imageName) {
            let resizedImage = originalImage.scaleImage(toSize: CGSize(width: 70, height: 70))
            btnSave.setImage(resizedImage, for: .normal)
        }
    }
    
}
