//
//  NSAttributedString+Extension.swift
//  OnboardingScreens
//
//  Created by Dmytro Hetman on 01.11.2023.
//

import Foundation

extension NSAttributedString {
    var fullLengthRange: NSRange {
        NSRange(location: 0, length: self.length)
    }
}
