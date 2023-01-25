//
//  ArticlesViewController.swift
//  iOSTrioEncyclopedia
//
//  Created by Filipe Rogério Canzi da Silva on 22/01/23.
//

import UIKit

class TopicsViewController: UIViewController {

    let topics: [Topic] = Topic.allCases

    let tableView = UITableView()
    let cellIdentifier: String = "TopicCell"
    let cellFont: UIFont = TableFont.topic
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        configureTableView()
    }

}


// MARK: - TableView Configuration

extension TopicsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func configureTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topics.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        cell.textLabel?.text = topics[indexPath.row].rawValue
        cell.textLabel?.font = cellFont
        cell.textLabel?.numberOfLines = 0
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let topicsListVC = TopicsListViewController()
        topicsListVC.topic = topics[indexPath.row]
        
        navigationController?.pushViewController(topicsListVC, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
