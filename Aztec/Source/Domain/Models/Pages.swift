//
//  Pages.swift
//  Aztec
//
//  Created by Matheus Torres on 13/08/23.
//

import Foundation

enum Pages {
    case beginning
    case gods
    case firstSun
    case herd
    case secondSun
    case hurricane
    case thirdSun
    case drought
    case fourthSun
    case flood
    case moon
    case human
    case fifthSun
    
    var topText: String? {
        switch self {
        case .beginning:
            return "pages.beginning.top"
        case .gods:
            return "pages.gods.top"
        case .firstSun:
            return "pages.firstSun.top"
        case .herd:
            return "pages.herd.top"
        case .secondSun:
            return "pages.secondSun.top"
        case .hurricane:
            return "pages.hurricane.top"
        case .thirdSun:
            return "pages.thirdSun.top"
        case .drought:
            return "pages.drought.top"
        case .fourthSun:
            return "pages.fourthSun.top"
        case .flood:
            return "pages.flood.top"
        case .moon:
            return "pages.moon.top"
        case .human:
            return "pages.human.top"
        case .fifthSun:
            return nil
        }
    }
    
    var bottomText: String? {
        switch self {
        case .beginning:
            return nil
        case .gods:
            return nil
        case .firstSun:
            return "pages.firstSun.bottom"
        case .herd:
            return "pages.herd.bottom"
        case .secondSun:
            return "pages.secondSun.bottom"
        case .hurricane:
            return nil
        case .thirdSun:
            return nil
        case .drought:
            return "pages.drought.bottom"
        case .fourthSun:
            return "pages.fourthSun.bottom"
        case .flood:
            return "pages.flood.bottom"
        case .moon:
            return "pages.moon.bottom"
        case .human:
            return "pages.human.bottom"
        case .fifthSun:
            return "pages.fifthSun.bottom"
        }
    }
    
    var next: Pages? {
        switch self {
        case .beginning:
            return .gods
        case .gods:
            return .firstSun
        case .firstSun:
            return .herd
        case .herd:
            return .secondSun
        case .secondSun:
            return .hurricane
        case .hurricane:
            return .thirdSun
        case .thirdSun:
            return .drought
        case .drought:
            return .fourthSun
        case .fourthSun:
            return .flood
        case .flood:
            return .moon
        case .moon:
            return .human
        case .human:
            return .fifthSun
        case .fifthSun:
            return nil
        }
    }
    
    var previous: Pages? {
        switch self {
        case .beginning:
            return nil
        case .gods:
            return .beginning
        case .firstSun:
            return .gods
        case .herd:
            return .firstSun
        case .secondSun:
            return .herd
        case .hurricane:
            return .secondSun
        case .thirdSun:
            return .hurricane
        case .drought:
            return .thirdSun
        case .fourthSun:
            return .drought
        case .flood:
            return .fourthSun
        case .moon:
            return .flood
        case .human:
            return .moon
        case .fifthSun:
            return .human
        }
    }
}
