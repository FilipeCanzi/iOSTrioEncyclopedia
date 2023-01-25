//
//  Topic.swift
//  iOSTrioEncyclopedia
//
//  Created by Filipe Rogério Canzi da Silva on 22/01/23.
//


// Caso dois tópicos estejam associados à Strings iguais, somente um deles será carregado no banco de dados.

enum Topic: String, CaseIterable {

    case gitHub = "GitHub"
    case navigationBar = "NavigationBar"
      
}
