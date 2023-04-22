//
//  LaunchButtonCell.swift
//  SpaceCraft
//
//  Created by aiv on 22.04.2023.
//

import UIKit

final class LaunchButtonCell: UITableViewCell {
    
    private let launchButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "launchCell")
        backgroundColor = .clear
        
        addSubview(launchButton)
        launchButton.translatesAutoresizingMaskIntoConstraints = false
        launchButton.setTitle("Посмотреть запуски", for: .normal)
        launchButton.titleLabel?.font = .init(name: Fonts.medium, size: 16)
        launchButton.titleLabel?.textColor = .white
        launchButton.backgroundColor = .systemGray6
        launchButton.layer.cornerRadius = 10
        launchButton.layer.cornerCurve = .continuous
        launchButton.contentEdgeInsets = .init(top: 20, left: 50, bottom: 20, right: 50)
        launchButton.sizeToFit()
        
        NSLayoutConstraint.activate([
            launchButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            launchButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
