//
//  DetailsViewController.swift
//  PeekPop
//
//  Created by Derouiche Elyes on 17/12/2022.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var viewModel: DetailsViewModel!
    
    lazy var contentView: UIView = {
        let view: UIView = .init()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var imageView: UIImageView = {
        let view: UIImageView = .init(image: viewModel.image)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 15
        return view
    }()
    
    lazy var ingredientLabel: UILabel = {
        buildHeaderLabel(text: "Ingredient")
    }()
    
    lazy var preparationLabel: UILabel = {
        buildHeaderLabel(text: "Preparation")
    }()
    
    lazy var ingredientDetailsText: UILabel = {
        buildContentText(text: viewModel.ingredient)
    }()
    
    lazy var preparationDetailsText: UILabel = {
        buildContentText(text: viewModel.preparation)
    }()
    
    lazy var footerContentView: UIView = {
        let view: UIView = .init()
        view.backgroundColor = .systemGroupedBackground
        return view
    }()
    
    lazy var footerStackView: UIStackView = {
        let view: UIStackView = .init()
        view.spacing = 10
        view.alignment = .center
        view.axis = .horizontal
        view.distribution = .fill
        return view
    }()
    
    lazy var emptyView: UIView = {
        let view: UIView = .init(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var actionShareItem: UIButton = {
        
        var config = UIButton.Configuration.plain()
        config.image = .init(systemName: "square.and.arrow.up")!
        
        let view: UIButton = .init(configuration: config, primaryAction: UIAction() { [weak self] _ in })
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var actionEditItem: UIButton = {
        
        var config = UIButton.Configuration.plain()
        config.image = .init(systemName: "square.and.pencil")!
        
        let view: UIButton = .init(configuration: config, primaryAction: UIAction() { [weak self] _ in })
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var actionDeleteItem: UIButton = {
        
        var config = UIButton.Configuration.plain()
        config.image = .init(systemName: "trash")!
        
        let view: UIButton = .init(configuration: config, primaryAction: UIAction() { [weak self] _ in })
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    // MARK: - UIVC Lifecycle
    
    init(viewModel: DetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setup
        setUpViews()
        addSubViewsComponents()
        setUpConstraints()
    }
    
    fileprivate func buildContentText(text: String) -> UILabel {
        let label: UILabel = .init()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .body)
        label.numberOfLines = 0
        label.text = text
        return label
    }
    
    fileprivate func buildHeaderLabel(text: String) -> UILabel {
        let label: UILabel = .init()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = .preferredFont(forTextStyle: .headline)
        label.text = text
        return label
    }
}

extension DetailsViewController: ViewConstraintAutoLayoutSetup {
    func setUpViews() {
        title = viewModel.title
        scrollView.alwaysBounceVertical = true
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func addSubViewsComponents() {
        
        // setup content view
        contentView.addSubview(imageView)
        contentView.addSubview(ingredientLabel)
        contentView.addSubview(preparationLabel)
        contentView.addSubview(ingredientDetailsText)
        contentView.addSubview(preparationDetailsText)
        
        // setup footer view
        footerStackView.addArrangedSubview(actionShareItem)
        footerStackView.addArrangedSubview(actionEditItem)
        footerStackView.addArrangedSubview(actionDeleteItem)
        footerStackView.addArrangedSubview(emptyView)
        
        footerContentView.addSubview(footerStackView)
        view.addSubview(footerContentView)
        
        scrollView.addSubview(contentView)
        view.addSubview(scrollView)
        
    }
    
    func setUpConstraints() {
        
        imageView.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: contentView.trailingAnchor, padding: .init(top: 32, left: 32, bottom: 0, right: 32), size: .init(width: 0, height: 300))
        
        ingredientLabel.anchor(top: imageView.bottomAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: contentView.trailingAnchor, padding: .init(top: 16, left: 16, bottom: 0, right: 16))
        
        ingredientDetailsText.anchor(top: ingredientLabel.bottomAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: contentView.trailingAnchor, padding: .init(top: 8, left: 16, bottom: 0, right: 16))
        
        preparationLabel.anchor(top: ingredientDetailsText.bottomAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: contentView.trailingAnchor, padding: .init(top: 16, left: 16, bottom: 8, right: 16))
        
        preparationDetailsText.anchor(top: preparationLabel.bottomAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: contentView.trailingAnchor, padding: .init(top: 8, left: 16, bottom: 0, right: 16))
        
        footerStackView.anchor(top: footerContentView.topAnchor, leading: footerContentView.leadingAnchor, bottom: footerContentView.safeAreaLayoutGuide.bottomAnchor, trailing: footerContentView.trailingAnchor,
                               padding: .init(top: 0, left: 16, bottom: 0, right: 16))
        footerContentView.anchor(top: nil, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, size: .init(width: 0, height: 90))
        
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ])
    }
}
