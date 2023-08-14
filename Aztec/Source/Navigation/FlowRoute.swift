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

enum FlowRoute: Hashable {
    case home
    case quizList
    case quiz(quiz: String)
    case settings
    
    static var defaultRoute: FlowRoute {
        return .home
    }
}
