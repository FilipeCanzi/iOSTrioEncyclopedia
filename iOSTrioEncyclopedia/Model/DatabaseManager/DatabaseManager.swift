//
//  ArticleManager.swift
//  iOSTrioEncyclopedia
//
//  Created by Filipe Rogério Canzi da Silva on 22/01/23.
//

import UIKit
import CoreData

class DatabaseManager {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var articlesDictionary: [String: Article] = [:]
    
    var databaseArticles: [DatabaseArticle] = []
    var databaseFavorites: [FavoriteData] = []
        
    init(resetArticles: Bool = false) {
        if resetArticles {
            resetArticleDatabase()
        }
    }
    
    init(cleanFavorites: Bool = false) {
        if cleanFavorites {
            cleanFavoritesDatabase()
        }
    }
    
    init(loaded: Bool = false) {
        if loaded {
            loadArticlesDictionary()
        }
    }
    
}


// MARK: - Reset Database Methods

extension DatabaseManager {
    
    private func resetArticleDatabase() {
        cleanArticleDatabase()
        createArticleDatabase()
    }
    
    
    private func saveContext() {
        do {
            try self.context.save()
        } catch {
            print("Error saving context: \(error)")
        }
    }
    
    
    private func cleanArticleDatabase() {
        
        let articlesRequest: NSFetchRequest<DatabaseArticle> = DatabaseArticle.fetchRequest()
        
        do {
            databaseArticles = try context.fetch(articlesRequest)
        } catch {
            print("Error reseting Database: \(error)")
        }
            
        for article in databaseArticles { self.context.delete(article) }
        
        saveContext()
        
    }
    
    private func createArticleDatabase() {
        
        for article in AllArticles.GabrielArticles {
            createDatabaseArticle(article)
        }
        
        for article in AllArticles.GuilhermeArticles {
            createDatabaseArticle(article)
        }
        
        for article in AllArticles.FilipeArticles {
            createDatabaseArticle(article)
        }
        
        self.saveContext()
        
    }
    
    private func createDatabaseArticle(_ article: Article) {
        
        let newDatabaseArticle = DatabaseArticle(context: self.context)
        
        newDatabaseArticle.topic = article.topic.rawValue
        newDatabaseArticle.author = article.author.rawValue
        newDatabaseArticle.keywords = article.keywords.joined(separator: " ")
        newDatabaseArticle.title = article.title
        
    }
    
}

// MARK: - Load Database Methods

extension DatabaseManager {
    
    private func loadArticlesDictionary() {
        
        for article in AllArticles.GabrielArticles {
            articlesDictionary[article.title] = article
        }
        
        for article in AllArticles.GuilhermeArticles {
            articlesDictionary[article.title] = article
        }
        
        for article in AllArticles.FilipeArticles {
            articlesDictionary[article.title] = article
        }
        
    }
    
}


// MARK: - FavoriteData Methods

extension DatabaseManager {
    
    func cleanFavoritesDatabase() {
        
        let favoriteRequest: NSFetchRequest<FavoriteData> = FavoriteData.fetchRequest()
        
        do {
            databaseFavorites = try context.fetch(favoriteRequest)
        } catch {
            print("Error reseting Database: \(error)")
        }
            
        for favorite in databaseFavorites { self.context.delete(favorite) }
        
        saveContext()
    }
    
    func favoriteData(articleTitle: String, articleAuthor: String) -> FavoriteData? {
        
        let request: NSFetchRequest<FavoriteData> = FavoriteData.fetchRequest()
            
        let titlePredicate = NSPredicate(format: DatabaseTerms.FavoriteData.titleMatches, articleTitle)
            
        request.predicate = titlePredicate

        do {
            
            let favoriteData = try context.fetch(request)
            
            if favoriteData.count == 1 {
                return favoriteData[0]
            }
            
            else if favoriteData.count > 1 {
                print("Error! Found more than one 'FavoriteData' for selected title!")
                return favoriteData[0]
            }
            
            else {
                return nil
            }
            
        } catch {
            print("Error fetching data: \(error)")
            return nil
        }
    }
    
    func createFavoriteData(for article: Article) {
        
        let newFavoriteData = FavoriteData(context: self.context)
        
        newFavoriteData.isFavorite = true
        newFavoriteData.title = article.title
        newFavoriteData.author = article.author.rawValue
        
        self.saveContext()
        
    }
    
    func deleteFavoriteData(for article: Article) {
        
        let favoriteData = self.favoriteData(articleTitle: article.title, articleAuthor: article.author.rawValue)
        
        if let favoriteData {
            self.context.delete(favoriteData)
        }
        
        self.saveContext()
        
    }
    
}

// MARK: - ArticleViewController Methods

extension DatabaseManager {
    
    func articleViewController(databaseArticle: DatabaseArticle) -> ArticleViewController {
        
        let articleVC = ArticleViewController()
        
        let article = articlesDictionary[databaseArticle.title ?? ""]
        articleVC.article = article
        
        let favoriteData = favoriteData(articleTitle: databaseArticle.title ?? "", articleAuthor: databaseArticle.author ?? "")
        
        articleVC.favoriteData = favoriteData
        
        articleVC.databaseManager = self
        
        return articleVC
    }
    
    func articleViewController(favoriteData: FavoriteData) -> ArticleViewController {
        
        let articleVC = ArticleViewController()
        
        let article = articlesDictionary[favoriteData.title ?? ""]
        articleVC.article = article
                
        articleVC.favoriteData = favoriteData
        
        articleVC.databaseManager = self
        
        return articleVC
    }
    
    
}
