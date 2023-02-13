//
//  ViewController.swift
//  whizziz
//
//  Created by Oğuzhan Kabul on 12.02.2023.
//

import UIKit
import TinyConstraints

class VisitorViewController: BaseViewController<VisitorViewModel> {
    
    let headerIcon = UIImageViewBuilder()
        .image(UIImage(named: .whizzizIconHorizontal)!)
        .backgroundColor(.clear)
        .contentMode(.scaleAspectFit)
        .build()
    
    let backgroundImage = UIImageViewBuilder()
        .image(UIImage(named: .loginBackgroundImg)!)
        .backgroundColor(.clear)
        .contentMode(.scaleAspectFit)
        .build()
    
    let titleLabel = UILabelBuilder()
        .text(L10n.welcomeWhizzizTitle)
        .numberOfLines(2)
        .textColor(.white)
        .font(UIFont(name: .rubikMedium, size: 49))
        .adjustsFontSizeToFitWidth(true)
        .minimumScaleFactor(0.6)
        .textAlignment(.center)
        .build()
    
    let buttonStackView = UIStackViewBuilder()
        .axis(.vertical)
        .alignment(.fill)
        .distribution(.fill)
        .spacing(16)
        .build()
    
    let tryWhizzizButton = UIButtonBuilder()
        .title(L10n.tryWhizzizButtonTitle)
        .backgroundColor(UIColor(named: .colorPrimary)!)
        .cornerRadius(10)
        .tintColor(.white)
        .titleFont(UIFont(name: .rubikBold, size: 16))
        .build()
    
    let loginButton = UIButtonBuilder()
        .title(L10n.loginButtonTitle)
        .backgroundColor(.clear)
        .cornerRadius(10)
        .borderWidth(1)
        .borderColor(UIColor(named: .colorPrimary)!.cgColor)
        .tintColor(UIColor(named: .colorPrimary)!)
        .titleFont(UIFont(name: .rubikBold, size: 16))
        .build()
    
    let loginWithGoogleButton = UIButtonBuilder()
        .title(L10n.loginWithGoogleButtonTitle)
        .backgroundColor(.clear)
        .cornerRadius(10)
        .borderWidth(1)
        .borderColor(UIColor(named: .colorPrimary)!.cgColor)
        .tintColor(UIColor(named: .colorPrimary)!)
        .titleFont(UIFont(name: .rubikBold, size: 16))
        .image(UIImage(named: .googleIcon)!.withRenderingMode(.alwaysOriginal))
        .build()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        addButtonTarget()
        
    }
    
    override func setupViews() {
        super.setupViews()
        
        buttonStackView.addArrangedSubview(tryWhizzizButton)
        buttonStackView.addArrangedSubview(loginButton)
        buttonStackView.addArrangedSubview(loginWithGoogleButton)
        
        view.addSubviews([headerIcon,
                          backgroundImage,
                          titleLabel,
                          buttonStackView])
        
        
    }
    
    override func setupLayouts() {
        super.setupLayouts()
        
        headerIcon.size(CGSize(width: 211, height: 40))
        headerIcon.centerXToSuperview()
        headerIcon.topToSuperview(offset: 64, usingSafeArea: true)
        
        backgroundImage.topToBottom(of: headerIcon, offset: 16)
        backgroundImage.leadingToSuperview(offset: 16)
        backgroundImage.trailingToSuperview(offset: 16)
        
        titleLabel.edges(to: backgroundImage, insets: TinyEdgeInsets(top: 112, left: 68, bottom: 112, right: 68))
        
        buttonStackView.topToBottom(of: backgroundImage)
        buttonStackView.leadingToSuperview(offset: 16)
        buttonStackView.trailingToSuperview(offset: 16)
        buttonStackView.bottomToSuperview(offset: -40, usingSafeArea: true)
        
        tryWhizzizButton.height(48)
        loginButton.height(48)
        loginWithGoogleButton.height(48)
        
        loginWithGoogleButton.imageView?.contentMode = .scaleAspectFit
        loginWithGoogleButton.imageEdgeInsets = UIEdgeInsets(top: 12, left: view.viewWidth/8, bottom: 12, right: view.viewWidth*2/3)
    }


}

// MARK: - Helper
extension VisitorViewController {
    func addButtonTarget() {
        tryWhizzizButton.addTarget(self, action: #selector(touchUpInside(_ :)), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(touchUpInside(_ :)), for: .touchUpInside)
        loginWithGoogleButton.addTarget(self, action: #selector(touchUpInside(_ :)), for: .touchUpInside)
    }
    
    @objc func touchUpInside(_ sender: UIButton) {
        switch sender {
        case tryWhizzizButton:
            viewModel.pushTryWhizziz()
        case loginButton:
            viewModel.pushLogin()
        case loginWithGoogleButton:
            viewModel.pushLoginWithGoogle()
        default:
            break
        }
    }
}

