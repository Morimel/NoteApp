//
//  OnBoardingViewController.swift
//  ls37
//
//  Created by Isa Melsov on 8/12/23.
//

import UIKit

class OnBoardingViewController: UIViewController {
    
    private let titles: [String] = ["Welcome to The Note", "Set Up Your Profile", "Dive into The Note"]
    
    private let secondTitle: [String] = ["Welcome to The Note – your new companion for tasks, goals, health – all in one place. Let's get started!", "Now that you're with us, let's get to know each other better. Fill out your profile, share your interests, and set your goals.", "You're fully equipped to dive into the world of The Note. Remember, we're here to assist you every step of the way. Ready to start? Let's go!"]
    
    private let imageNames: [String] = ["man", "woman", "manWorking"]

    private lazy var onBoardingCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(OnBoardingCell.self, forCellWithReuseIdentifier: OnBoardingCell.reuseID)
        view.dataSource = self
        view.delegate = self
        view.isPagingEnabled = true
        view.showsHorizontalScrollIndicator = false
        
        return view
    }()
    
    private lazy var pageControl: UIPageControl = {
        let view = UIPageControl()
        view.numberOfPages = 3
        view.currentPage = 0
        view.currentPageIndicatorTintColor = .black
        view.pageIndicatorTintColor = .gray
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstaints()
    }
    
    private func setupConstaints() {
        view.addSubview(onBoardingCollectionView)
        onBoardingCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            onBoardingCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            onBoardingCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            onBoardingCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            onBoardingCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -260),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

extension OnBoardingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnBoardingCell.reuseID, for: indexPath) as! OnBoardingCell
        cell.setup(imageName: imageNames[indexPath.row], title: titles[indexPath.row], secondTitle: secondTitle[indexPath.row])
        return cell
    }
}

extension OnBoardingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.size.width
        if pageWidth > 0 {
            let page: CGFloat = scrollView.contentOffset.x / pageWidth
            let roundedPage = round(Double(page))
            pageControl.currentPage = Int(roundedPage)
        } else {
            print("Error")
        }
    }
}
