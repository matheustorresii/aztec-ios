//
//  FlowRoute.swift
//  Aztec
//
//  Created by Matheus Torres on 13/08/23.
//

import Foundation

enum FlowNavigationStyle {
    case push(FlowRoute)
    case pop
}

enum FlowRoute: String, Hashable {
    case home = "HOME"
    case quiz = "QUIZ"
    case settings = "SETTINGS"
    
    static var defaultRoute: FlowRoute {
        return .home
    }
}
