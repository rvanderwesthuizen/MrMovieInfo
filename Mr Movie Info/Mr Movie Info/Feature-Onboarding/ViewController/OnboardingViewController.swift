//
//  OnboardingViewController.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/10/27.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet private weak var nextButton: UIButton!
    @IBOutlet private weak var pageControl: UIPageControl!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    let slides = [OnboardingSlide(title: "Search", image: UIImage(named: "SearchView")!, description: "Search by title for your favourite movies and series"), OnboardingSlide(title: "Movie Details", image: UIImage(named: "MovieDetailsView")!, description: "View the plot, writers, actors etc. of the movies or series searched."), OnboardingSlide(title: "Watchlist", image: UIImage(named: "WatchlistView")!, description: "Keep track of the movies and series you've watched.")]
    
    var currentSlide = 0 {
        didSet {
            if currentSlide == slides.count - 1 {
                nextButton.setTitle("Get Started", for: .normal)
            } else {
                nextButton.setTitle("Next", for: .normal)
            }
            pageControl.currentPage = currentSlide
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styling()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func styling() {
        nextButton.backgroundColor = MyAppStyle.darkBackgroundColor
        nextButton.tintColor = MyAppStyle.accentColor
        nextButton.titleLabel?.font = MyAppStyle.buttonTextFont
        
        collectionView.backgroundColor = MyAppStyle.backgroundColor
        pageControl.tintColor = MyAppStyle.bodyTextColor
        pageControl.currentPageIndicatorTintColor = MyAppStyle.accentColor
        
        self.view.backgroundColor = MyAppStyle.backgroundColor
    }
    
    @IBAction func didTapNextButton(_ sender: UIButton) {
        if currentSlide == slides.count - 1 {
            let controller = storyboard?.instantiateViewController(withIdentifier: "TabBarVC") as! UITabBarController
            controller.modalPresentationStyle = .fullScreen
            present(controller, animated: true)
        } else {
            currentSlide += 1
            let index = IndexPath(item: currentSlide, section: 0)
            collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentSlide = Int(scrollView.contentOffset.x / width)
    }

}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        slides.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as? OnboardingCollectionViewCell else { return UICollectionViewCell()}
        cell.configure(with: slides[indexPath.row])
        cell.backgroundColor = MyAppStyle.backgroundColor
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}
