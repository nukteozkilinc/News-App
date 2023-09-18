//
//  ViewController.swift
//  News App
//
//  Created by Nukte Ozkilinc on 6.09.2023.
//

import UIKit

protocol OnboardingViewInterface: AnyObject {
    func prepareCollectionView()
    func handleOutput(title: String, currentPage:Int)
    func goToLogin(identifier: String)
}

final class OnboardingViewController: UIViewController {
    
    private lazy var viewModel: OnboardingViewModelInterface = OnboardingViewModel()
    
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
        viewModel.fetchData()
    }
    
    @IBAction func pressedNextButton(_ sender: UIButton) {
        viewModel.goToNextPage()
    }
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        
        cell.setUp(viewModel.slides[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) { // Edit page control
        let width = scrollView.frame.width
        viewModel.swipeSlide(swipeRight: Int(scrollView.contentOffset.x / width))
    }
}

extension OnboardingViewController: OnboardingViewInterface{
    func goToLogin(identifier: String) {
        performSegue(withIdentifier: identifier, sender: nil)
    }
    
    func handleOutput(title: String, currentPage: Int) {
        pageControl.currentPage = currentPage
        nextBtn.setTitle(title, for: .normal)
        let indexPath = IndexPath(item: currentPage, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    func prepareCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}
