//
//  String+Extension.swift
//  OnboardingScreens
//
//  Created by Dmytro Hetman on 31.10.2023.
//

import UIKit

extension String {
    var image: UIImage? {
        UIImage(named: self)
    }
    
    var color: UIColor? {
        UIColor(named: self)
    }
}
