//
//  LaunchViewController.swift
//  SpaceCraft
//
//  Created by aiv on 26.04.2023.
//

import UIKit

class LaunchViewController: UITableViewController {
    
    var launchIndex: Int
    let data = Bundle.main.decode([LaunchModel].self, from: "LaunchJSON.json")
    var launchArray: [LaunchModel] = []
    
    init(launch: Int) {
        self.launchIndex = launch
        
        for launch in data {
            if launchIndex == launch.id {
                launchArray.append(launch)
            }
        }
        super.init(style: .insetGrouped)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .init(named: "BackgroundColor")
        tableView.separatorColor = .clear
        tableView.allowsSelection = false
        tableView.register(LaunchCell.self, forCellReuseIdentifier: "launchCell")
        tableView.rowHeight = 100
    }
}

extension LaunchViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "launchCell") as! LaunchCell
        myCell.textLabel?.text = launchArray[indexPath.row].name
        myCell.detailTextLabel?.text = "\(launchArray[indexPath.row].date), \(launchArray[indexPath.row].location)"
        myCell.accessoryView = UIImageView(image: .init(named: "succes"))
        let imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        imgView.image = .init(named: "success")
        myCell.accessoryView = imgView
        return myCell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return launchArray.count
    }

}
