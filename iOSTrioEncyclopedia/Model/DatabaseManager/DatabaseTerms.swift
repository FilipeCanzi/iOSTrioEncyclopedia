//
//  DatabaseTerms.swift
//  iOSTrioEncyclopedia
//
//  Created by Filipe Rogério Canzi da Silva on 23/01/23.
//

struct DatabaseTerms {
    
    enum DatabaseArticle {
        
        static let titleContains = "title CONTAINS[cd] %@"
        // [cd] faz não ser "case sensitive" e "diacritic sensitive", ou seja, a busca não será sensível à letras serem maíusculas ou minúsculas, e também não será sensível ao fato das letras terem sinais diacríticos ("ç" é entendido como "c" - isso também afeta letras de outras línguas).
        
        static let keywordsContains = "keywords CONTAINS [cd] %@"
        
        static let topicMatches = "topic MATCHES %@"
        
    }
    
    enum FavoriteData {
        
        static let isFavoriteMatches = "isFavorite == %@"
        
        static let titleMatches = "title MATCHES %@"
        
        static let authorMatcher = "author MATCHES %@"
        
    }
    
    
    
    
    
}
