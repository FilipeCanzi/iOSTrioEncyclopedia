//
//  SpacerView.swift
//  iOSTrioEncyclopedia
//
//  Created by Filipe Rogério Canzi da Silva on 23/01/23.
//

import UIKit

class SpacerView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    convenience init(spacing: CGFloat) {
        self.init(frame: .zero)
        
        self.widthAnchor.constraint(equalToConstant: spacing).isActive = true
        self.heightAnchor.constraint(equalToConstant: spacing).isActive = true
        
    }
    
    convenience init(verticalSpacing: CGFloat?) {
        self.init(frame: .zero)
                
        if let verticalSpacing {
            self.heightAnchor.constraint(equalToConstant: verticalSpacing)
                .isActive = true
        }
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
