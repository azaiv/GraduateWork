import UIKit

class LaunchViewController: UIViewController {
    
    var launchIndex: Int
    var launchArray: [LaunchModel] = []
    
    private let tableView = UITableView.init(frame: .zero, style: .plain)
    
    init(launch: Int) {
        self.launchIndex = launch
        
        for launch in RocketData.launchesData {
            if launchIndex == launch.id {
                launchArray.append(launch)
            }
        }
        
        super.init(nibName: nil, bundle: nil)
        view.addSubview(tableView)
        tableView.frame = view.bounds
        view.backgroundColor = .init(named: "BackgroundColor")
        tableView.allowsSelection = false
        tableView.register(LaunchCell.self, forCellReuseIdentifier: "launchCell")
        tableView.rowHeight = 100
        tableView.separatorColor = .init(named: "BackgroundColor")
        tableView.dataSource = self
        tableView.separatorInset = .zero
        tableView.backgroundColor = .init(named: "BackgroundColor")
        title = launchArray[self.launchIndex].rocket
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

