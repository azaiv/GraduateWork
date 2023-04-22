//
//  SpaceCraftViewController.swift
//  SpaceCraft
//
//  Created by aiv on 20.04.2023.
//

import UIKit

class SpaceCraftViewController: UITableViewController {
    
    var spacecraft: SpaceCraftModel
    
    init(spacecraft: SpaceCraftModel) {
        self.spacecraft = spacecraft
        super.init(style: .grouped)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .init(named: "BackgroundColor")
        tableView.separatorColor = .clear
        tableView.allowsSelection = false
        tableView.register(ImageCell.self, forCellReuseIdentifier: "imageCell")
        tableView.register(TitleCell.self, forCellReuseIdentifier: "titleCell")
        tableView.register(InfoCell.self, forCellReuseIdentifier: "infoCell")
        tableView.register(DestinationCell.self, forCellReuseIdentifier: "desCell")
        tableView.register(LaunchButtonCell.self, forCellReuseIdentifier: "launchCell")
    }
}

extension SpaceCraftViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell")! as! ImageCell
            cell.setImage(name: spacecraft.image)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell") as! TitleCell
            cell.textLabel?.text = spacecraft.name
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell")! as! InfoCell
            
            let key = ["Производитель:",
                       "Количество ступеней:",
                       "Длина:",
                       "Диаметр:",
                       "Масса:",
                       "Топливо:",
                       "Статус",
                       "Количество запусков:"
                       ]
            let value = [
                "\(spacecraft.manufacturer)",
                "\(spacecraft.noStages)",
                "\(spacecraft.length)",
                "\(spacecraft.diameter)",
                "\(spacecraft.startMass)",
                "\(spacecraft.fuelType)",
                "\(spacecraft.status)",
                "\(spacecraft.noLaunches!)"
            ]
            cell.textLabel?.text = key[indexPath.row]
            cell.detailTextLabel?.text = value[indexPath.row]
            
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "desCell") as! DestinationCell
            cell.textLabel?.text = spacecraft.description
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "launchCell") as! LaunchButtonCell
            return cell
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 2:
            return 8
        default:
            return 1
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 2:
            return "ИНФОРМАЦИЯ:"
        case 3:
            return "ОПИСАНИЕ:"
        default:
            return nil
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 300
        case 2:
            return 60
        case 3:
            return 300
        default: return 44
        }
    }
}
