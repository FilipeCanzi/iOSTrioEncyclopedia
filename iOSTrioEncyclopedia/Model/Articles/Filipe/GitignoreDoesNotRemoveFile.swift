//
//  GitIgnoreNotWorking.swift
//  iOSTrioEncyclopedia
//
//  Created by Filipe Rogério Canzi da Silva on 22/01/23.
//

import Foundation

struct GitignoreDoesNotRemoveFile: Article {

    var author: Author = .filipe
    var topic: Topic = .gitHub
    
    var title: String = "Gitignore não remove o arquivo inserido"

    var keywords: Set<String> = ["gitignore", "GitHub", "remover"]
    
    var texts: [String] = []
    
    init() {
        
        keywords.insert(author.rawValue)
        keywords.insert(topic.rawValue)
        
        texts.append(
            "Quando você produz uma alteração no arquivo .gitignore, essa alteração não deverá remover o arquivo cujo nome você acabou de inserir na lista de ignorados. Isso acontece por que o arquivo já foi adicionado ao git.")
        
        texts.append("Até, é importante tomar cuidado com isso, pois alterações realizadas neste arquivo continuarão sendo consideradas.")
        
        texts.append("Para resolver este problema, você terá que remover todos os arquivos, e adiciona-los novamente. Neste processo, o git fará uma releitura do gitignore antes de adicionar o arquivo que gostaria de remover.")
        
        texts.append("Os códigos para realizar essa operação são:")
        
        texts.append("git rm -rf --cached .")
        
        texts.append("git add .")
    }
    
}

