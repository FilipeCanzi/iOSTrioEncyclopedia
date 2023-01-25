//
//  SearchViewController.swift
//  iOSTrioEncyclopedia
//
//  Created by Filipe Rogério Canzi da Silva on 22/01/23.
//

import UIKit
import CoreData

class SearchViewController: UIViewController {
    
    var databaseArticles: [DatabaseArticle] = []
    
    let databaseManager = DatabaseManager(loaded: true)
    
    let tableView = UITableView()
    let cellIdentifier: String = "SearchCell"
    
    let keywordSearchBar = UISearchBar()
    var searchBarText: String = ""
    var isSearchResult: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        configureKeywordSearchBar()
        configureTableView()
        
    }
    
}


extension SearchViewController {
    
    func loadDatabaseArticles() {
        
        let userTextOnSearchBar = searchBarText
        
        let request: NSFetchRequest<DatabaseArticle> = DatabaseArticle.fetchRequest()
        
        let keywordPredicate = NSPredicate(format: DatabaseTerms.DatabaseArticle.keywordsContains, userTextOnSearchBar)
        
        let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
        
        request.predicate = keywordPredicate
        request.sortDescriptors = [sortDescriptor]
                
        do {
            databaseArticles = try databaseManager.context.fetch(request)
        } catch {
            print("Error fetching data to context in SearchBar: \(error)")
        }
        
    }
    
}

extension SearchViewController: UISearchBarDelegate {
    
    func configureKeywordSearchBar() {
        keywordSearchBar.delegate = self
        keywordSearchBar.placeholder = "Digite uma palavra-chave"
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        loadDatabaseArticles()
        tableView.reloadData()
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
                
        if searchBarText.count != 1 && searchText == "" {
                        
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
            
            searchBarText = searchText
            loadDatabaseArticles()
            tableView.reloadData()
            
        }
        else if searchText == "" {
            
            searchBarText = searchText
            loadDatabaseArticles()
            tableView.reloadData()
            
        }
        else {
            searchBarText = searchText
        }
        
    }
    
    
}


extension SearchViewController: UITableViewDelegate, UITableViewDataSource {

    func configureTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        cell.textLabel?.text = databaseArticles[indexPath.row].title
        cell.textLabel?.font = TableFont.article
        cell.textLabel?.numberOfLines = 0
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return databaseArticles.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let articleVC = databaseManager.articleViewController(databaseArticle: databaseArticles[indexPath.row])
        
        navigationController?.pushViewController(articleVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
