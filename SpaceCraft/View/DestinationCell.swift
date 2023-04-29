//
//  DestinationCell.swift
//  SpaceCraft
//
//  Created by aiv on 22.04.2023.
//

import UIKit

final class DestinationCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "desCell")
        
        backgroundColor = .clear
        
        textLabel?.font = .init(name: Fonts.regular, size: 16)
        textLabel?.textColor = .white
        textLabel?.numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
