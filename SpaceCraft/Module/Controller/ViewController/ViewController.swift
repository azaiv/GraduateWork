import UIKit

class TestViewController: UIViewController, UIScrollViewDelegate {
    
    var rocket: RocketModel
    var infoLabel: [String] = []
    
    private let scrollView = UIScrollView()
    private let imageView = UIImageView()
    private let tableView = UITableView.init(frame: .zero, style: .grouped)
    private let imageHeight: CGFloat = 350
    
    init(rockets: RocketModel) {
        self.rocket = rockets
        super.init(nibName: nil, bundle: nil)
        
        infoLabel = ["\(self.rocket.manufacturer)", "\(self.rocket.noStages)", "\(self.rocket.length)", "\(self.rocket.diameter)", "\(self.rocket.startMass)", "\(self.rocket.fuelType)", "\(self.rocket.status)", "\(self.rocket.noLaunches!)"]
        
        view.backgroundColor = .init(named: "BackgroundColor")
        
        tableView.dataSource = self
        tableView.delegate = self
        scrollView.delegate = self
        
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(tableView)
        
        tableView.register(TitleCell.self, forCellReuseIdentifier: "titleCell")
        tableView.register(InfoCell.self, forCellReuseIdentifier: "infoCell")
        tableView.register(DescriptionCell.self, forCellReuseIdentifier: "desCell")
        tableView.register(ButtonCell.self, forCellReuseIdentifier: "launchButtonCell")
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "header")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        imageView.image = .init(named: self.rocket.image)
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.frame = .init(x: .zero, y: -scrollView.safeAreaInsets.top, width: view.frame.width, height: imageHeight)
        
        scrollView.frame = view.bounds
        scrollView.showsVerticalScrollIndicator = false
        
        tableView.backgroundColor = .init(named: "BackgroundColor")
        tableView.separatorColor = .clear
        tableView.frame = .init(x: 0, y: imageView.frame.maxY - 30, width: view.frame.width, height: 1500)

        tableView.layer.cornerRadius = 30
        tableView.layer.cornerCurve = .continuous
        tableView.allowsSelection = false
        
        scrollView.contentSize = .init(width: view.frame.size.width,
                                       height: 1650)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y + scrollView.safeAreaInsets.top
        
        guard y < 0 else { return }
        
        imageView.frame = .init(
            x: .zero,
            y: -scrollView.safeAreaInsets.top + y,
            width: scrollView.frame.width,
            height: imageHeight + abs(y))
        
        scrollView.scrollIndicatorInsets.top = imageView.frame.height - scrollView.safeAreaInsets.top
    }
    
    @objc func openLaunches() {
        let vc = UINavigationController(rootViewController: LaunchViewController(launch: rocket.id))
        if let sheetController = vc.sheetPresentationController {
            sheetController.detents = [.medium(), .large()]
            sheetController.largestUndimmedDetentIdentifier = .large
            sheetController.prefersScrollingExpandsWhenScrolledToEdge = true
            sheetController.prefersGrabberVisible = true
        }
        vc.navigationBar.standardAppearance.titleTextAttributes = [ .font: UIFont(name: Fonts.medium, size: 16)]
        present(vc, animated: true)
    }
}
