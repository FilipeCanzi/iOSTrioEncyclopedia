//
//  TopicsListViewController.swift
//  iOSTrioEncyclopedia
//
//  Created by Filipe Rogério Canzi da Silva on 24/01/23.
//

import UIKit
import CoreData

class TopicsListViewController: ArticleListViewController {
    
    var topic: Topic? = nil    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = topic?.rawValue
        loadArticles(by: topic)
        
    }
    
}

extension TopicsListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return databaseArticles.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        cell.textLabel?.text = databaseArticles[indexPath.row].title
        cell.textLabel?.font = TableFont.article
        cell.textLabel?.numberOfLines = 0
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let articleVC = databaseManager.articleViewController(databaseArticle: databaseArticles[indexPath.row])
        
        navigationController?.pushViewController(articleVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
