//
//  ViewController.swift
//  PeekPop
//
//  Created by Derouiche Elyes on 18/12/2022.
//

import UIKit
import Combine

enum Sections: Hashable {
    case main
}

class HomeViewController: UIViewController {
    
    var viewModel: HomeViewModel
    var cancellables = Set<AnyCancellable>()
    
    // MARK: - UIRelated instances
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        return tableView
    }()
    
    private lazy var tableViewDataSource: UITableViewDiffableDataSource<Sections, Recipe> = {
        let dataSource = UITableViewDiffableDataSource<Sections, Recipe>(tableView: tableView) { tableView, _, recette in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RecetteDetailsViewCell.self)) as? RecetteDetailsViewCell else {
                return UITableViewCell()
            }
            cell.setup(with: recette)
            return cell
        }
        return dataSource
    }()
    
    // MARK: - UIVC Lifecycle
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Recipes"
        // Run Setup
        setUpViews()
        addSubViewsComponents()
        setUpConstraints()
        
        // setup reactive binding
        setupBinding()
    }
    
    private func setupBinding() {
        viewModel.$recipes
            .receive(on: DispatchQueue.main)
            .sink { [weak self] recipes in
                self?.configureInitialDiffableSnapshot()
            }
            .store(in: &cancellables)
    }
    
    private func configureInitialDiffableSnapshot() {
        //First we need to init the diffableDataSource
        var snapshot = NSDiffableDataSourceSnapshot<Sections, Recipe>()
        
        //Then we append the sections and items
        snapshot.appendSections([.main])
        snapshot.appendItems(viewModel.recipes, toSection: .main)
        
        //Finally we apply the snapshot on tableViewDataSource
        tableViewDataSource.apply(snapshot, animatingDifferences: false)
    }
}

extension HomeViewController: ViewConstraintAutoLayoutSetup {
    
    func setUpViews() {
        
    }
    
    func addSubViewsComponents() {
        view.addSubview(tableView)
    }
    
    func setUpConstraints() {
        tableView.fillSuperview()
    }
}

