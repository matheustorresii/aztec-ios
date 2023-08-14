//
//  NavigableView.swift
//  Aztec
//
//  Created by Matheus Torres on 13/08/23.
//

import Combine
import SwiftUI

protocol NavigableView: View {
    var navigation: PassthroughSubject<FlowNavigationStyle, Never> { get }
}
