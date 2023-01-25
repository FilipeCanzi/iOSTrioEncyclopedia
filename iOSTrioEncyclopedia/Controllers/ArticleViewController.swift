//
//  ArticleViewController.swift
//  iOSTrioEncyclopedia
//
//  Created by Filipe Rogério Canzi da Silva on 22/01/23.
//

import UIKit

class ArticleViewController: UIViewController {
    
    var article: Article?
    var favoriteData: FavoriteData?
    var databaseManager: DatabaseManager?
    
    var author: Author?
    var topic: Topic?
    var articleTitle: String?
    var keywords: Set<String>?
    var texts: [String]?
    
    var isFavorite: Bool?
    
    let titleFont: UIFont = .systemFont(ofSize: 25, weight: .bold)
    let keywordFont: UIFont = .systemFont(ofSize: 15)
    let textFont: UIFont = .systemFont(ofSize: 20)
    
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    let navBarFavoriteButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadArticle()
        loadFavoriteData()
        
        setupView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadFavoriteData()
        updateFavoriteButtonImage()
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
    }


}


// MARK: - Article Methods

extension ArticleViewController {
    
    func loadArticle() {
        
        author = article?.author
        topic = article?.topic
        articleTitle = article?.title
        keywords = article?.keywords
        texts = article?.texts
        
    }
    
}


// MARK: - FavoriteData Methods

extension ArticleViewController {
    
    func loadFavoriteData() {
        
        isFavorite = favoriteData?.isFavorite

    }
    
    func updateFavoriteButtonImage() {
        
        if isFavorite == true {
            navBarFavoriteButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        } else {
            navBarFavoriteButton.setImage(UIImage(systemName: "star"), for: .normal)
        }
        
        
    }
    
    @objc func favoriteButtonPressed() {
        
        guard let article else { return }
        
        if isFavorite == true {
            isFavorite = false
            databaseManager?.deleteFavoriteData(for: article)
        }
        else {
            isFavorite = true
            databaseManager?.createFavoriteData(for: article)
        }
        
        updateFavoriteButtonImage()
        
    }
    
}
