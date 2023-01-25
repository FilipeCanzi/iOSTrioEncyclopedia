//
//  ArticlesListViewController.swift
//  iOSTrioEncyclopedia
//
//  Created by Filipe Rogério Canzi da Silva on 22/01/23.
//

import UIKit
import CoreData

class ArticleListViewController: UIViewController {
    
    var databaseArticles: [DatabaseArticle] = []
    var favoriteDataArray: [FavoriteData] = []
    
    let databaseManager = DatabaseManager(loaded: true)

    let tableView = UITableView()
    let cellIdentifier: String = "ArticleCell"    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configureTableView()
    }
    
}

// MARK: - Load Articles by Topic

extension ArticleListViewController {
    
    func loadArticles(by topic: Topic?) {
        
        guard let topic else { return }
                    
        let request: NSFetchRequest<DatabaseArticle> = DatabaseArticle.fetchRequest()
            
        let topicPredicate = NSPredicate(format: DatabaseTerms.DatabaseArticle.topicMatches, topic.rawValue)
                
        let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
            
        request.predicate = topicPredicate
        request.sortDescriptors = [sortDescriptor]
                    
        do {
            databaseArticles = try databaseManager.context.fetch(request)
        } catch {
            print("Error fetching data: \(error)")
        }
        
    }
    
    func loadFavoriteArticles() {
        
        let request: NSFetchRequest<FavoriteData> = FavoriteData.fetchRequest()
            
        let favoritePredicate = NSPredicate(format: DatabaseTerms.FavoriteData.isFavoriteMatches, NSNumber(true))
        
        let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
            
        request.predicate = favoritePredicate
        request.sortDescriptors = [sortDescriptor]
                    
        do {
            favoriteDataArray = try databaseManager.context.fetch(request)
        } catch {
            print("Error fetching data: \(error)")
        }
        
    }
    
}


// MARK: - TableView Configuration

extension ArticleListViewController: UITableViewDelegate, UITableViewDataSource {

    func configureTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Must be configured in subclass
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Must be configured in subclass
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Must be configured in subclass
    }
    
}
