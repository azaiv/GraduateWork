//
//  ImageCell.swift
//  SpaceCraft
//
//  Created by aiv on 20.04.2023.
//

import UIKit

class ImageCell: UITableViewCell {
    private let image = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "imageCell")
//        backgroundColor = .clear
        image.image = .init(named: "id1")
        addSubview(image)
        
        image.frame = .init(x: frame.width / 2, y: frame.height / 2, width: 300, height: 300)
        image.center.y = frame.height / 2
        image.center.x = frame.width / 2
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
