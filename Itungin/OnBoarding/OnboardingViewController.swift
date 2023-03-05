//
//  OnboardingViewController.swift
//  Itungin
//
//  Created by Hastomi Riduan Munthe on 05/03/23.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == imagesSlide.count - 1 {
                nextButton.setTitle("Get Started", for: .normal)
            } else {
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }
    
    let imagesSlide = ["image1","image2","image3"]
    let textLabel = ["Input Transaction Easily","Categorize Your Transaction!","Financial Overview"]
    let textDescription = ["Scan it, Say it, or Type it","Classify your cash-flow by categories","Evaluate your income and Expense to adjust your lifestyle properly"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nibNAme = UINib(nibName: "CollectionViewCell", bundle: nil)
        self.collectionView.register(nibNAme, forCellWithReuseIdentifier: "cell")
    }
    @IBAction func nextButtonClicked(_ sender: Any) {
        
        if currentPage == imagesSlide.count - 1  {
            print(" Go to the next page")
            // Next Page 
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return textLabel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell

        cell.imageView.image = UIImage(named: imagesSlide[indexPath.row])
        cell.slideTitleLabel.text = textLabel[indexPath.row]
        cell.slideDescriptionLabel.text = textDescription[indexPath.row]

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
       
    }
}
