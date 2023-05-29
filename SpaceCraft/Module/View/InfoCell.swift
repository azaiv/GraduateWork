import UIKit

final class InfoCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: "infoCell")
        
        backgroundColor = .clear
        
        textLabel?.font = .init(name: Fonts.regular, size: 18)
        textLabel?.textColor = .lightText
        textLabel?.numberOfLines = 0
        
        detailTextLabel?.font = .init(name: Fonts.medium, size: 16)
        detailTextLabel?.textColor = .white
        detailTextLabel?.numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

