//
//  SunPages.swift
//  Aztec
//
//  Created by Matheus Torres on 20/08/23.
//

import SwiftUI

enum SunPages: Int, PageProtocol {
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
    
    var view: AnyView {
        var view: any View
        switch self {
        case .beginning:
            view = Text(String.empty)
        case .gods:
            view = GodsPageView()
        case .firstSun:
            view = FirstSunPageView()
        case .herd:
            view = HerdPageView()
        case .secondSun:
            view = SecondSunPageView()
        case .hurricane:
            view = HurricanePageView()
        case .thirdSun:
            view = ThirdSunPageView()
        case .drought:
            view = DroughtPageView()
        case .fourthSun:
            view = FourthSunPageView()
        case .flood:
            view = FloodPageView()
        case .moon:
            view = MoonPageView()
        case .human:
            view = HumanPageView()
        case .fifthSun:
            view = FifthSunPageView()
        }
        return AnyView(view)
    }
    
    static var start: PageProtocol {
        return SunPages.beginning
    }
    
    var next: PageProtocol? {
        return SunPages(rawValue: self.rawValue+1)
    }
    
    var previous: PageProtocol? {
        return SunPages(rawValue: self.rawValue-1)
    }
    
    var value: Int {
        return self.rawValue
    }
    
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
}
