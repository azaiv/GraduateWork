//
//  ButtonCell.swift
//  SpaceCraft
//
//  Created by aiv on 22.04.2023.
//

import UIKit

final class ButtonCell: UITableViewCell {
    
    let launchButton = UIButton()
    var index = 0
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "launchButtonCell")
        
        backgroundColor = .clear
        contentView.addSubview(launchButton)
        
        launchButton.translatesAutoresizingMaskIntoConstraints = false
        launchButton.layer.cornerRadius = 10
        launchButton.layer.cornerCurve = .continuous
        launchButton.contentEdgeInsets = .init(top: 50, left: 0, bottom: 50, right: 0)
        launchButton.sizeToFit()
        launchButton.setTitle("Посмотреть запуски", for: .normal)
        launchButton.titleLabel?.font = .init(name: Fonts.medium, size: 16)
        launchButton.titleLabel?.textColor = .white
        launchButton.backgroundColor = .init(named: "RedAccentColor")
        
        
        NSLayoutConstraint.activate([
            launchButton.topAnchor.constraint(equalTo: topAnchor),
            launchButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            launchButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            launchButton.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
