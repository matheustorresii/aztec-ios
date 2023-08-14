//
//  String+Extensions.swift
//  Aztec
//
//  Created by Matheus Torres on 14/08/23.
//

import Foundation

extension String {
    static var empty: String = ""
    static var space: String = " "
    
    func localized() -> String {
        NSLocalizedString(self, comment: .empty)
    }
}
