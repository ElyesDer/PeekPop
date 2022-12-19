//
//  DetailsViewModel.swift
//  PeekPop
//
//  Created by Derouiche Elyes on 17/12/2022.
//

import UIKit

class DetailsViewModel {
    var coordinator: Coordinator
    
    private var recipe: Recipe
    
    var title: String
    var image: UIImage
    var ingredient: String
    var preparation: String
    
    init(coordinator: Coordinator!, recipe: Recipe) {
        self.coordinator = coordinator
        self.recipe = recipe
        title = recipe.name
        image = UIImage(named: recipe.imageName)!
        ingredient = recipe.ingredient
        preparation = recipe.preparation
    }
}
