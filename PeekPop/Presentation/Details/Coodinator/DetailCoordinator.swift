//
//  DetailCoordinator.swift
//  PeekPop
//
//  Created by Derouiche Elyes on 17/12/2022.
//

import UIKit

class DetailsCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    var recipe: Recipe
    
    init(navigationController : UINavigationController, recipe: Recipe) {
        self.navigationController = navigationController
        self.recipe = recipe
    }
    
    func start() {
        print("Coordinator Start")
        redirectToDetails(recipe: recipe)
    }
    
    func redirectToDetails(recipe: Recipe){
        let detailsViewModel = DetailsViewModel(coordinator: self, recipe: recipe)
        
        let vc = DetailsViewController(viewModel: detailsViewModel)
        navigationController.pushViewController(vc, animated: true)
    }
    
    deinit {
        print("AppCoordinator Deinit")
    }
}
