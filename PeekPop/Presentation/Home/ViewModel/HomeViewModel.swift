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
    
    func randomAddRecipe() {
        let recipe: Recipe = .init(name: "Ramdom name", requiredTime: 0.5, note: 3)
        
        self.recipes.append(recipe)
    }
}
