//
//  MainViewController.swift
//  SpaceCraft
//
//  Created by aiv on 03.05.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    var index: Int
    
    private let continueButton = UIButton()
    private let logo = UIImageView()
    
    init(index: Int) {
        self.index = index
        
        super.init(nibName: nil, bundle: nil)
        
        setupView()
        constraintView()
        configureApperance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainViewController {
    
    func setupView() {
        view.addSubview(continueButton)
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(logo)
        logo.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func constraintView() {
        NSLayoutConstraint.activate([
            continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            continueButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            
            logo.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logo.widthAnchor.constraint(equalToConstant: view.frame.width)
        ])
    }
    
    func configureApperance() {
        continueButton.sizeToFit()
        continueButton.layer.masksToBounds = true
        continueButton.contentEdgeInsets = .init(top: 20, left: 20, bottom: 20, right: 20)
        continueButton.setTitle("Взлетаем!", for: .normal)
        continueButton.titleLabel?.font = .init(name: Fonts.medium, size: 22)
        continueButton.layer.cornerRadius = 10
        continueButton.layer.cornerCurve = .continuous
        continueButton.addTarget(self, action: #selector(openSpaceCraft), for: .touchUpInside)
        
        logo.layer.masksToBounds = true
        logo.contentMode = .scaleAspectFit
        
        switch index {
        case 0:
            logo.image = .init(named: "RoscosmosLogo")
            continueButton.backgroundColor = .init(named: "RedAccentColor")
        default:
            logo.image = .init(named: "SpaceXLogo")
            continueButton.backgroundColor = .init(named: "BlueAccentColor")
        }
    }
    
    @objc func openSpaceCraft() {
        let firstVC = DetailPageViewController(organizationIndex: index)
        firstVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(firstVC, animated: true)
    }
}
