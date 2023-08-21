//
//  PageProtocol.swift
//  Aztec
//
//  Created by Matheus Torres on 20/08/23.
//

import SwiftUI

protocol PageProtocol {
    static var start: PageProtocol { get }
    
    var next: PageProtocol? { get }
    var previous: PageProtocol? { get }
    var value: Int { get }
    var topText: String? { get }
    var bottomText: String? { get }
    var view: AnyView { get }
}
