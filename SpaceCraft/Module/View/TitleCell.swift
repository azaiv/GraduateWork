import UIKit

final class TitleCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "titleCell")
        
        backgroundColor = .clear
        
        textLabel?.font = .init(name: Fonts.medium, size: 32)
        textLabel?.textColor = .white
        textLabel?.numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
