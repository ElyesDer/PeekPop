//
//  HomeViewModel.swift
//  PeekPop
//
//  Created by Derouiche Elyes on 18/12/2022.
//

import Foundation

class HomeViewModel {
    var coordinator: Coordinator!
    
    @Published
    var recipes: Recipes = []
}
