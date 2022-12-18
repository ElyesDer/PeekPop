//
//  ViewConstrainsAutoLayout.swift
//  PeekPop
//
//  Created by Derouiche Elyes on 18/12/2022.
//

import Foundation

/// This procol serves as guide to setup UIView implementing AutoLayout constraints
protocol ViewConstraintAutoLayoutSetup {
    func setUpViews()
    func addSubViewsComponents()
    func setUpConstraints()
}
