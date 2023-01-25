//
//  RootTabBarController.swift
//  iOSTrioEncyclopedia
//
//  Created by Filipe Rogério Canzi da Silva on 22/01/23.
//

import UIKit

class RootTabBarController: UITabBarController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setViewControllers(
            [
                topicsNavigationController(),
                searchNavigationController(),
                favoritesNavigationController()
            ],
            animated: true)
        
        modalPresentationStyle = .fullScreen

    }
    
}


// MARK: - NavigationControllers Configuration

extension RootTabBarController {
    
    func topicsNavigationController() -> UINavigationController {
        
        let topicsVC = TopicsViewController()
        topicsVC.title = "Tópicos"
        
        let topicsNavigationController = UINavigationController(rootViewController: topicsVC)
        topicsNavigationController.tabBarItem.title = "Tópicos"
        topicsNavigationController.tabBarItem.image = UIImage(systemName: "book")
        topicsNavigationController.navigationBar.prefersLargeTitles = true
        
        return topicsNavigationController
        
    }
    
    func searchNavigationController() -> UINavigationController {
        
        let searchVC = SearchViewController()
        searchVC.title = "Pesquisa"
        
        let searchNavigationController = UINavigationController(rootViewController: searchVC)
        searchNavigationController.tabBarItem.title = "Pesquisa"
        searchNavigationController.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        searchNavigationController.navigationBar.prefersLargeTitles = true
        
        return searchNavigationController
        
    }
    
    func favoritesNavigationController() -> UINavigationController {
        
        let favoriteListVC = FavoriteListViewController()
        favoriteListVC.title = "Favoritos"
        
        let favoritesNavigationController = UINavigationController(rootViewController: favoriteListVC)
        favoritesNavigationController.tabBarItem.title = "Favoritos"
        favoritesNavigationController.tabBarItem.image = UIImage(systemName: "star")
        favoritesNavigationController.navigationBar.prefersLargeTitles = true
        
        return favoritesNavigationController
        
    }
    
}
