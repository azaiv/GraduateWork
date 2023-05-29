import UIKit

final class ButtonCell: UITableViewCell {
    
    let launchButton = UIButton()
    var index = 0
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "launchButtonCell")
        
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupButton()
    }
    
    func setupButton() {
        contentView.addSubview(launchButton)
        launchButton.layer.cornerRadius = 10
        launchButton.layer.cornerCurve = .continuous
        launchButton.setTitle("Посмотреть запуски", for: .normal)
        launchButton.titleLabel?.font = .init(name: Fonts.medium, size: 16)
        launchButton.titleLabel?.textColor = .white
        launchButton.backgroundColor = .init(named: "RedAccentColor")
        launchButton.contentEdgeInsets = .init(top: 10, left: 40, bottom: 10, right: 40)
        launchButton.sizeToFit()
        launchButton.center.y = contentView.frame.height / 2
        launchButton.center.x = contentView.frame.width / 2
    }
}

