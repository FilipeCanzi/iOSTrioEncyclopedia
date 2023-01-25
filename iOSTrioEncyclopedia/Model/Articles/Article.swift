//
//  Article.swift
//  iOSTrioEncyclopedia
//
//  Created by Filipe Rogério Canzi da Silva on 22/01/23.
//

import UIKit

protocol Article {
    
    var author: Author { get }
    var topic: Topic { get }

    var title: String { get }
    
    var keywords: Set<String> { get }
    
    var texts: [String] { get }
    
}


struct ArticleModel: Article {

    var author: Author = Author.allCases.randomElement()!
    var topic: Topic = Topic.allCases.randomElement()!
    
    var title: String = ""
    
    var keywords: Set<String> = ["", "", ""]
    
    var texts: [String] = []
    
    init() {
           
        keywords.insert(author.rawValue)
        keywords.insert(topic.rawValue)
        
        texts.append("")
        
        texts.append("--- --- --- --- ---")
        
        texts.append("")
    }
    
}
