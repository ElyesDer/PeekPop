//
//  RecetteDetailsViewCell.swift
//  PeekPop
//
//  Created by Derouiche Elyes on 18/12/2022.
//

import Foundation

import UIKit

class RecetteDetailsViewCell: UITableViewCell {
    
    static let identifier = "RecetteDetailsViewCell"
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var durationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var noteSView: UIStackView = {
        let view: UIStackView = .init()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.spacing = 2
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
    
    var starImageView: UIImageView {
        let starImageView: UIImageView = .init(image: .init(systemName: "star.fill"))
        starImageView.tintColor = .systemYellow
        starImageView.translatesAutoresizingMaskIntoConstraints = false
        starImageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        return starImageView
    }
    
    var content: Recipe!
    
    func setup(with data: Recipe) {
        self.content = data
        selectionStyle = .none
        self.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        // setup image loading
        setUpViews()
        setUpConstraints()
    }
}

extension RecetteDetailsViewCell: ViewConstraintAutoLayoutSetup {
    func setUpViews() {
        nameLabel.text = content.name
        durationLabel.text = "\(content.requiredTime) mn"
        
        setupStarView(count: content.note)
        
        addSubview(nameLabel)
        addSubview(durationLabel)
        addSubview(noteSView)
    }
    
    func setupStarView(count: Int) {
        noteSView.subviews.forEach { view in
            view.removeFromSuperview()
        }
        
        (1...count).forEach { _ in
            noteSView.addArrangedSubview(starImageView)
        }
        noteSView.addArrangedSubview(emptyView)
    }
    
    func addSubViewsComponents() {
        
    }
    
    func setUpConstraints() {
        noteSView.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: nil,
                         padding: .init(top: 2, left: 8, bottom: 2, right: 0))
        nameLabel.anchor(top: self.topAnchor, leading: nil, bottom: self.bottomAnchor, trailing: durationLabel.leadingAnchor)
        
        durationLabel.anchor(top: self.topAnchor, leading: nil, bottom: self.bottomAnchor, trailing: self.trailingAnchor,
                             padding: .init(top: 2, left: 0, bottom: 2, right: 18))
        
        NSLayoutConstraint.activate([
            nameLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5),
            durationLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.2),
            noteSView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3)
        ])
    }
}
