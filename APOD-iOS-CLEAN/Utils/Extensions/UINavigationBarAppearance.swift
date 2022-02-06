//
//  UINavigationBarAppearance.swift
//  APOD-iOS-CLEAN
//
//  Created by Jorge Luis Rivera Ladino on 30/01/22.
//

import UIKit

extension UINavigationBarAppearance {
    
    func setup(backgroundColor: UIColor) -> UINavigationBarAppearance {
    
        let apperance = UINavigationBarAppearance()
        
        apperance.largeTitleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 28),
            .foregroundColor: UIColor.white
        ]
        apperance.titleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 18),
            .foregroundColor: UIColor.white
        ]
        
        apperance.backgroundColor = backgroundColor
        
        return apperance
    }
    
}

