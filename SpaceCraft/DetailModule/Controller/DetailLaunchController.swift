//
//  SecondLaunchViewController.swift
//  SpaceCraft
//
//  Created by aiv on 26.04.2023.
//

import UIKit

class DetailLaunchController: UITableViewController {
    
    var launchIndex: Int
    let launchesData = Bundle.main.decode([LaunchModel].self, from: "RLaunchJSON.json")
    var launchArray: [LaunchModel] = []
    
    init(launch: Int) {
        self.launchIndex = launch
        
        for launch in launchesData {
            if launchIndex == launch.id {
                launchArray.append(launch)
            }
        }
        
        super.init(style: .insetGrouped)
        navigationItem.title = launchesData[self.launchIndex].rocket
        view.backgroundColor = .init(named: "BackgroundColor")
        tableView.allowsSelection = false
        tableView.register(LaunchCell.self, forCellReuseIdentifier: "launchCell")
        tableView.rowHeight = 100
        tableView.separatorColor = .init(named: "BackgroundColor")
        tableView.separatorInset = .zero
        
        navigationController?.navigationBar.tintColor = .brown
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DetailLaunchController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "launchCell") as! LaunchCell
        myCell.textLabel?.text = launchArray[indexPath.row].name
        myCell.detailTextLabel?.text = """
        \(launchArray[indexPath.row].getFirstFlightDate)
        \(launchArray[indexPath.row].location)
        """
        let imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        imgView.image = launchArray[indexPath.row].result == true ? .init(named: "success") : .init(named: "failed")
        myCell.accessoryView = imgView
        return myCell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return launchArray.count
    }
}
