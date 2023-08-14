//
//  Pages.swift
//  Aztec
//
//  Created by Matheus Torres on 13/08/23.
//

import Foundation

enum Pages {
    case first
    case second
    case third
    
    var next: Pages? {
        switch self {
        case .first:
            return .second
        case .second:
            return .third
        case .third:
            return nil
        }
    }
    
    var previous: Pages? {
        switch self {
        case .first:
            return nil
        case .second:
            return .first
        case .third:
            return .second
        }
    }
}
