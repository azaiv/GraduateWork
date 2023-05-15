//
//  DetailTableViewController.swift
//  SpaceCraft
//
//  Created by aiv on 20.04.2023.
//

import UIKit

class DetailTableViewController: UITableViewController {

    var spacecraft: RocketModel
    var infoLabel: [String] = []
    let nameLabel = ["Производитель", "Количество ступеней", "Длина", "Диаметр", "Масса", "Топливо", "Статус", "Количество запусков"]

    init(spacecraft: RocketModel) {
        self.spacecraft = spacecraft
        super.init(style: .grouped)
        
        view.backgroundColor = .init(named: "BackgroundColor")

        infoLabel = ["\(self.spacecraft.manufacturer)", "\(self.spacecraft.noStages)", "\(self.spacecraft.length)", "\(self.spacecraft.diameter)", "\(self.spacecraft.startMass)", "\(self.spacecraft.fuelType)", "\(self.spacecraft.status)", "\(self.spacecraft.noLaunches!)"]
        
        tableView.separatorColor = .clear
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(ImageCell.self, forCellReuseIdentifier: "imageCell")
        tableView.register(TitleCell.self, forCellReuseIdentifier: "titleCell")
        tableView.register(InfoCell.self, forCellReuseIdentifier: "infoCell")
        tableView.register(DescriptionCell.self, forCellReuseIdentifier: "desCell")
        tableView.register(ButtonCell.self, forCellReuseIdentifier: "launchButtonCell")
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "headerView")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DetailTableViewController {
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
            cell.textLabel?.text = nameLabel[indexPath.row]
            cell.detailTextLabel?.text = infoLabel[indexPath.row]
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "desCell") as! DescriptionCell
            cell.textLabel?.text = spacecraft.description
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "launchButtonCell") as! ButtonCell
            cell.launchButton.addTarget(self, action: #selector(openLaunches), for: .touchUpInside)
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 2:
            return nameLabel.count
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

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerView")!
        header.textLabel?.font = .init(name: Fonts.medium, size: 20)
        header.textLabel?.textColor = .init(named: "RedAccentColor")
        header.contentConfiguration = .none
        header.backgroundConfiguration = .clear()
        return header
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 2:
            return 44
        case 3:
            return 44
        default:
            return 0
        }
    }
    
    @objc func openLaunches() {
        let vc = DetailLaunchController(launch: spacecraft.id)
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
