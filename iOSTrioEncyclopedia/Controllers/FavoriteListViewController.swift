//
//  FavoritesViewController.swift
//  iOSTrioEncyclopedia
//
//  Created by Filipe Rogério Canzi da Silva on 22/01/23.
//

import UIKit

class FavoriteListViewController: ArticleListViewController {
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadFavoriteArticles()
        tableView.reloadData()
    }
    
}

extension FavoriteListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteDataArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        cell.textLabel?.text = favoriteDataArray[indexPath.row].title
        cell.textLabel?.font = TableFont.article
        cell.textLabel?.numberOfLines = 0
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let articleVC = databaseManager.articleViewController(favoriteData:  favoriteDataArray[indexPath.row])
        
        navigationController?.pushViewController(articleVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
