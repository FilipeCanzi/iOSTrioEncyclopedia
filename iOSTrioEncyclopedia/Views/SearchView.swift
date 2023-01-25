//
//  SearchView.swift
//  iOSTrioEncyclopedia
//
//  Created by Filipe Rogério Canzi da Silva on 24/01/23.
//

import UIKit

extension SearchViewController {
    
    func setupView() {
        setupKeywordsSearchBar()
        setupTableView()
    }
    
    
}

// MARK: - TableView Setup

extension SearchViewController {
    
    func setupKeywordsSearchBar() {
        
        view.addSubview(keywordSearchBar)
        keywordSearchBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(keywordsSearchBarConstraints())
        
    }
    
    func keywordsSearchBarConstraints() -> [NSLayoutConstraint] {
        let safeGuide = view.safeAreaLayoutGuide
        return [
            keywordSearchBar.topAnchor.constraint(equalTo: safeGuide.topAnchor),
            keywordSearchBar.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor),
            keywordSearchBar.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor),
        ]
    }
    
    
    func setupTableView() {
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate( tableViewConstraints() )
        
    }
    
    func tableViewConstraints() -> [NSLayoutConstraint] {
        let safeGuide = view.safeAreaLayoutGuide
        return [
            tableView.topAnchor.constraint(equalTo: keywordSearchBar.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeGuide.bottomAnchor),
        ]
    }
    
}
