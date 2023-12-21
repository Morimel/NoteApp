//
//  OnBoardingCell.swift
//  ls37
//
//  Created by Isa Melsov on 8/12/23.
//

import UIKit

class OnBoardingCell: UICollectionViewCell {
    
    static var reuseID = "onboardingCell"
    
    private let image: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    private lazy var titleLable: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 22, weight: .bold)
        return view
    }()
    
    private let secondTitleLabel: UILabel = {
        let view = UILabel()
        view.textAlignment = .left
        view.font = .systemFont(ofSize: 14, weight: .light)
        view.numberOfLines = 0
        return view
    }()
    
    private let skipBtn: UIButton = {
        let view = UIButton()
//        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = 10
        view.setTitle("Skip", for: .normal)
        view.setTitleColor(UIColor(red: 1, green: 0.24, blue: 0.24, alpha: 1), for: .normal )

        
        return view
    }()
    
    private let nextBtn: UIButton = {
        let view = UIButton()
        view.layer.cornerRadius = 20
        view.setTitle("Next", for: .normal)
        view.setTitleColor(.white, for: .normal)
//        view.frame = CGRect(x: 0, y: 0, width: 173, height: 42)
        view.layer.backgroundColor = UIColor(red: 1, green: 0.237, blue: 0.237, alpha: 1).cgColor

        
        return view
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(imageName:String, title: String, secondTitle: String) {
        image.image = UIImage(named: imageName)
        titleLable.text = title
        secondTitleLabel.text = secondTitle
    }
    
    private func setupConstraints() {
        contentView.addSubview(titleLable)
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(secondTitleLabel)
        secondTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(skipBtn)
        skipBtn.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nextBtn)
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 160),
            image.centerXAnchor.constraint(equalTo: centerXAnchor),
            image.widthAnchor.constraint(equalToConstant: 211),
            image.heightAnchor.constraint(equalToConstant: 140),
            
            titleLable.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 52),
            titleLable.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            secondTitleLabel.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 16),
            secondTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            secondTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            
            skipBtn.topAnchor.constraint(equalTo: secondTitleLabel.bottomAnchor, constant: 160),
            skipBtn.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            skipBtn.widthAnchor.constraint(equalToConstant: 160),
            
            nextBtn.topAnchor.constraint(equalTo: secondTitleLabel.bottomAnchor, constant: 160),
            nextBtn.leadingAnchor.constraint(equalTo: skipBtn.trailingAnchor, constant: 12),
            nextBtn.widthAnchor.constraint(equalToConstant: 173),
            nextBtn.heightAnchor.constraint(equalToConstant: 42)
        ])
    }
}
    

