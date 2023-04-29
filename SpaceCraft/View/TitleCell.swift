//
//  TitleCell.swift
//  SpaceCraft
//
//  Created by aiv on 22.04.2023.
//

import UIKit

final class TitleCell: UITableViewCell {
    
    private let image = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "titleCell")
        
        backgroundColor = .clear
        
        textLabel?.font = .init(name: Fonts.medium, size: 32)
        textLabel?.textColor = .init(named: "HeaderColor")
        textLabel?.numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
