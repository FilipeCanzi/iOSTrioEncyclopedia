//
//  NavigationBarItemWithCustomSize.swift
//  iOSTrioEncyclopedia
//
//  Created by Filipe Rogério Canzi da Silva on 23/01/23.
//

struct NavigationBarItemWithCustomSize: Article {

    var author: Author = .filipe
    var topic: Topic = .navigationBar
    
    var title: String = "Como fazer um UIBarButtonItem ser composto por uma imagem de tamanho qualquer"
    
    var keywords: Set<String> = ["UIBarButtonItem", "NavigationBar", "BarItem", "Size"]
    
    var texts: [String] = []
    
    init() {
        
        keywords.insert(author.rawValue)
        keywords.insert(topic.rawValue)
        
        texts.append("Para fazer com que um UIBarButtonItem tenha uma imagem de tamanho customizável, você pode criar uma extensão para esta classe.")
        
        texts.append("Ao fazer isso, tome cuidado com o tamanho máximo que você pode colocar neste item sem quebrar o AutoLayout!")
        
        texts.append("Você pode usar código abaixo como exemplo:")
        
        texts.append("--- --- --- --- ---")
        
        texts.append("import UIKit")
        texts.append("extension UIBarButtonItem {")
        texts.append("static func squareButton(lenght: CGFloat, image: UIImage?, target: Any?, action: Selector) -> UIBarButtonItem {")
        
        texts.append("let button = UIButton(type: .system)")
        texts.append("button.setImage(image, for: .normal)")
        texts.append("button.addTarget(target, action: action, for: .touchUpInside)")
        
        texts.append("// O tamanho limite para modo Portrait 44.")
        texts.append("// O tamanho limite para modo landscape é 32.")
        texts.append("// Maior que isso o AutoLayout quebra.")
        texts.append("var buttonLenght: CGFloat = 32")
        
        texts.append("if lenght <= buttonLenght { buttonLenght = lenght }")
        
        texts.append("let barItem = UIBarButtonItem(customView: button)")
        texts.append("barItem.customView?.translatesAutoresizingMaskIntoConstraints = false")
        texts.append("barItem.customView?.heightAnchor.constraint(equalToConstant: buttonLenght).isActive = true")
        texts.append("barItem.customView?.widthAnchor.constraint(equalToConstant: buttonLenght).isActive = true")
        
        texts.append("return barItem")
        texts.append("}")
        
        texts.append("}")
    }
    
}


/* CÓDIGO UTILIZADO
 
 import UIKit

 extension UIBarButtonItem {
     
     static func squareButton(lenght: CGFloat, image: UIImage?, target: Any?, action: Selector) -> UIBarButtonItem {

         let button = UIButton(type: .system)
         button.setImage(image, for: .normal)
         button.addTarget(target, action: action, for: .touchUpInside)
         
     // O tamanho limite para modo Portrait 44.
     // O tamanho limite para modo landscape é 32.
     // Maior que isso o AutoLayout quebra.
         var buttonLenght: CGFloat = 32
         
         if lenght <= buttonLenght { buttonLenght = lenght }
         
         let barItem = UIBarButtonItem(customView: button)
         barItem.customView?.translatesAutoresizingMaskIntoConstraints = false
         barItem.customView?.heightAnchor.constraint(equalToConstant: buttonLenght).isActive = true
         barItem.customView?.widthAnchor.constraint(equalToConstant: buttonLenght).isActive = true

         return barItem
     }

 }
 
 */
