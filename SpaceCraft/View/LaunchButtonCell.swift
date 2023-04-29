//
//  LaunchButtonCell.swift
//  SpaceCraft
//
//  Created by aiv on 22.04.2023.
//

import UIKit

final class LaunchButtonCell: UITableViewCell {
    
    let launchButton = UIButton()
    var index = 0
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "launchButtonCell")
        
        backgroundColor = .clear
        contentView.addSubview(launchButton)
        
        launchButton.translatesAutoresizingMaskIntoConstraints = false
        launchButton.setTitle("Посмотреть запуски", for: .normal)
        launchButton.titleLabel?.font = .init(name: Fonts.medium, size: 16)
        launchButton.titleLabel?.textColor = .white
        launchButton.backgroundColor = .init(named: "HeaderColor")
        launchButton.layer.cornerRadius = 10
        launchButton.layer.cornerCurve = .continuous
        launchButton.contentEdgeInsets = .init(top: 20, left: 0, bottom: 20, right: 0)
        launchButton.sizeToFit()
        
        NSLayoutConstraint.activate([
            launchButton.topAnchor.constraint(equalTo: topAnchor),
            launchButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            launchButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            launchButton.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
