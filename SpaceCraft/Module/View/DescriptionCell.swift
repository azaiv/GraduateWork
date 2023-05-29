import UIKit

final class DescriptionCell: UITableViewCell {
    
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
