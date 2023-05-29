import UIKit

final class LaunchCell: UITableViewCell {
    
    var success = true
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: "launchCell")
        
        backgroundColor = .init(named: "BackgroundColor")
        textLabel?.font = .init(name: Fonts.regular, size: 14)
        textLabel?.textColor = .white
        textLabel?.numberOfLines = 0
        
        detailTextLabel?.font = .init(name: Fonts.medium, size: 11)
        detailTextLabel?.textColor = .systemGray
        detailTextLabel?.numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(success: Bool) {
        self.success = success
    }
}

