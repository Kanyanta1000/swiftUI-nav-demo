//
//  Router.swift
//  SwiftUINavDemo
//
//  Created by Kanyanta Mubanga on 27.12.2020.
//

import Combine

final class Router: ObservableObject {
    
    @Published var tabSelection = 1
    @Published var playerSelection: Int? = nil
}
