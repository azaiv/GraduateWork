//
//  InformationCell.swift
//  SpaceCraft
//
//  Created by aiv on 20.04.2023.
//

import UIKit

class InformationCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: "infoCell")
        backgroundColor = .clear
        textLabel?.font = .init(name: Fonts.regular, size: 14)
        textLabel?.textColor = .systemGray
        detailTextLabel?.font = .init(name: Fonts.regular, size: 14)
        detailTextLabel?.textColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
