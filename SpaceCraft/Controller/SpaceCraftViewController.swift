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
        tableView.register(ImageCell.self, forCellReuseIdentifier: "imageCell")
        tableView.register(InformationCell.self, forCellReuseIdentifier: "infoCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

extension SpaceCraftViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell")! as! ImageCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as! UITableViewCell
            cell.textLabel?.text = spacecraft.name
            cell.textLabel?.font = .init(name: Fonts.medium, size: 32)
            cell.backgroundColor = .clear
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell")! as! InformationCell
            let data = fetchInformation()
            let key = ["Производитель:",
                       "Количество ступеней:",
                       "Количество запусков:",
                       "Длина:",
                       "Диаметр:",
                       "Масса:",
                       "Топливо:",
                       "Максимальная дистанция:"]
            let value = [
                "\(spacecraft.manufacturer)",
                "\(spacecraft.noStages)",
                "\(String(describing: spacecraft.noLaunches))",
                "\(spacecraft.length)",
                "\(spacecraft.diameter)",
                "\(spacecraft.startMass)",
                "\(spacecraft.fuelType)",
                "\(spacecraft.maxDistance)",
            ]
            cell.textLabel?.text = key[indexPath.row]
            cell.detailTextLabel?.text = value[indexPath.row]
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as! UITableViewCell
            cell.backgroundColor = .clear
            cell.textLabel?.text = spacecraft.description
            cell.textLabel?.font = .init(name: Fonts.ligth, size: 16)
            cell.textLabel?.numberOfLines = 0
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as! UITableViewCell
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
        case 3:
            return 500
        default:
            return 45
        }
    }
}

extension SpaceCraftViewController {
    func fetchInformation() -> [String: String] {
        let information = [
            "Производитель": "\(spacecraft.manufacturer)",
            "Количество ступеней": "\(spacecraft.noStages)",
            "Количество запусков": "\(String(describing: spacecraft.noLaunches))",
            "Длина": "\(spacecraft.length)",
            "Диаметр": "\(spacecraft.diameter)",
            "Масса": "\(spacecraft.startMass)",
            "Топливо": "\(spacecraft.fuelType)",
            "Максимальная дистанция": "\(spacecraft.maxDistance)",
        ]
        return information
    }
}
