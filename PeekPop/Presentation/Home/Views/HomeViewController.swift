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
    
    // MARK: - UI Related instances
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.delegate = self
        return tableView
    }()
    
    lazy var footerContentView: UIView = {
        let view: UIView = .init()
        view.backgroundColor = .systemGroupedBackground
        return view
    }()
    
    lazy var footerStackView: UIStackView = {
        let view: UIStackView = .init()
        view.spacing = 2
        view.alignment = .leading
        view.axis = .vertical
        view.distribution = .fill
        return view
    }()
    
    lazy var actionAddItem: UIButton = {
        
        var config = UIButton.Configuration.plain()
        config.image = .init(systemName: "plus")!
        
        let view: UIButton = .init(configuration: config, primaryAction: UIAction() { _ in
            
        })
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
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

//MARK: Layout setup

extension HomeViewController: ViewConstraintAutoLayoutSetup {
    
    func setUpViews() {
        
    }
    
    func addSubViewsComponents() {
        view.addSubview(tableView)
        
        // setup footer view
        footerStackView.addArrangedSubview(actionAddItem)
        footerContentView.addSubview(footerStackView)
        
        view.addSubview(footerContentView)
    }
    
    func setUpConstraints() {
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: footerContentView.topAnchor, trailing: view.trailingAnchor)
        
        footerStackView.anchor(top: footerContentView.topAnchor, leading: footerContentView.leadingAnchor, bottom: footerContentView.safeAreaLayoutGuide.bottomAnchor, trailing: footerContentView.trailingAnchor,
                               padding: .init(top: 0, left: 16, bottom: 0, right: 16))
        footerContentView.anchor(top: nil, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, size: .init(width: 0, height: 90))
        
        NSLayoutConstraint.activate([
            actionAddItem.heightAnchor.constraint(equalToConstant: 30),
            actionAddItem.widthAnchor.constraint(equalToConstant: 30),
        ])
    }
}
