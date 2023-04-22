//
//  ImageCell.swift
//  SpaceCraft
//
//  Created by aiv on 20.04.2023.
//

import UIKit

final class ImageCell: UITableViewCell {
    private let image = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "imageCell")
        
        backgroundColor = .clear
        contentView.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 10
        image.layer.cornerCurve = .continuous

        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalToConstant: 300),
            image.widthAnchor.constraint(equalToConstant: 300),
            image.centerYAnchor.constraint(equalTo: centerYAnchor),
            image.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImage(name: String) {
        image.image = .init(named: name)
    }
}
