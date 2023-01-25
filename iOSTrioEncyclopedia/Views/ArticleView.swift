//
//  ArticleView.swift
//  iOSTrioEncyclopedia
//
//  Created by Filipe Rogério Canzi da Silva on 23/01/23.
//

import UIKit

extension ArticleViewController {
    
    func setupView() {
        
        setupTitle()
        
        setupScrollView()
        setupStackView()
        
        setupSubviews()
        
        setupNavigationBar()
        
    }
    
    func setupTitle() {
        guard let author else { return }
        self.title = "Artigo do " + author.rawValue
    }
    

}

// MARK: - ScrollView and StackView Methods

extension ArticleViewController {
    
    func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        NSLayoutConstraint.activate(scrollViewConstraints())
    }
    
    func scrollViewConstraints() -> [NSLayoutConstraint] {
        let safeView = view.safeAreaLayoutGuide
        return [
            scrollView.centerXAnchor.constraint(equalTo: safeView.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: safeView.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: safeView.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeView.bottomAnchor),
        ]
    }
    
    func setupStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stackView)
        
        stackView.axis = .vertical
        
        NSLayoutConstraint.activate(stackViewConstraints())
    }
    
    func stackViewConstraints() -> [NSLayoutConstraint] {
        return [
            stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 8),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -8),
        ]
        
    }
    

    
}

// MARK: - Labels Methods

extension ArticleViewController {
    
    func setupSubviews() {
        
        stackView.addArrangedSubview(titleLabel())
        stackView.addArrangedSubview(SpacerView(verticalSpacing: 8))
        stackView.addArrangedSubview(keywordsLabel())
        stackView.addArrangedSubview(SpacerView(verticalSpacing: 20))
        
        for label in textLabels() {
            stackView.addArrangedSubview(label)
            stackView.addArrangedSubview(SpacerView(verticalSpacing: 15))
        }
        
    }
    
    
    func titleLabel() -> UILabel {
        
        let titleLabel = UILabel()
        
        titleLabel.text = articleTitle
        titleLabel.font = titleFont
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return titleLabel
    }
    
    func textLabels() -> [UILabel] {
        
        guard let texts else { return [] }
        
        var textLabels: [UILabel] = []
        
        for text in texts {
            let textLabel = UILabel()
            textLabel.text = text
            textLabel.font = textFont
            textLabel.numberOfLines = 0
            textLabel.translatesAutoresizingMaskIntoConstraints = false
            textLabels.append(textLabel)
        }
        
        return textLabels
    }
    
    func keywordsLabel() -> UILabel {
        
        let keywordsLabel = UILabel()
        let keywordsText = keywords?.joined(separator: ", ") ?? "(não informado)"
        
        keywordsLabel.text = "Palavras-Chave: " + keywordsText
        keywordsLabel.font = keywordFont
        keywordsLabel.numberOfLines = 0
        keywordsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return keywordsLabel
    }
    
    
}


// MARK: - NavigationBar Configuration

extension ArticleViewController {
    
    func setupNavigationBar() {
        
        let navBar = navigationController?.navigationBar
        navBar?.tintColor = .black
                
        if isFavorite == true {
            navBarFavoriteButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        } else {
            navBarFavoriteButton.setImage(UIImage(systemName: "star"), for: .normal)
        }
        
        navBarFavoriteButton.addTarget(self, action: #selector(favoriteButtonPressed), for: .touchUpInside)
        
        let favoriteBarButtonItem = UIBarButtonItem(customView: navBarFavoriteButton)
        favoriteBarButtonItem.customView?.translatesAutoresizingMaskIntoConstraints = false
        favoriteBarButtonItem.customView?.heightAnchor.constraint(equalToConstant: 30)
            .isActive = true
        favoriteBarButtonItem.customView?.widthAnchor.constraint(equalToConstant: 30)
            .isActive = true
        
        navigationItem.rightBarButtonItem = favoriteBarButtonItem
        
    }

}
