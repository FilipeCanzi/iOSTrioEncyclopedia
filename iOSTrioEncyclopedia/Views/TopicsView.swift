//
//  TopicsView.swift
//  iOSTrioEncyclopedia
//
//  Created by Filipe Rogério Canzi da Silva on 22/01/23.
//

import UIKit

extension TopicsViewController {
    
    func setupView() {
        setupTableView()
    }
    
}


// MARK: - TableView Setup

extension TopicsViewController {
    
    func setupTableView() {
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate( tableViewConstraints() )

    }
    
    func tableViewConstraints() -> [NSLayoutConstraint] {
        
        let safeGuide = view.safeAreaLayoutGuide
        
        return [
            tableView.topAnchor.constraint(equalTo: safeGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeGuide.bottomAnchor),
        ]
    }
    
}
