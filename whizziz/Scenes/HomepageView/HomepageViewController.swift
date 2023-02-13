//
//  HomepageViewController.swift
//  whizziz
//
//  Created by Oğuzhan Kabul on 13.02.2023.
//

import UIKit
import TinyConstraints

class HomepageViewController: BaseViewController<HomepageViewModel> {
    
    let usernameLabel = UILabelBuilder()
        .text(L10n.welcomeWhizzizTitle)
        .numberOfLines(2)
        .textColor(.black)
        .font(UIFont(name: .rubikMedium, size: 49))
        .adjustsFontSizeToFitWidth(true)
        .minimumScaleFactor(0.6)
        .textAlignment(.center)
        .build()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUsernameText()
    }
    
    override func setupViews() {
        super.setupViews()
        view.addSubview(usernameLabel)
    }
    
    override func setupLayouts() {
        super.setupLayouts()
        usernameLabel.edgesToSuperview()
    }
    
    private func setUsernameText() {
        usernameLabel.text = "Hosgeldin, \(viewModel.userName)"
    }
}
