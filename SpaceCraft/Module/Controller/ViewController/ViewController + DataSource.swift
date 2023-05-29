import UIKit

extension TestViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell")! as! TitleCell
            cell.textLabel?.text = rocket.name
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell")! as! InfoCell
            cell.textLabel?.text = RocketData.discriptionStrings[indexPath.row]
            cell.detailTextLabel?.text = infoLabel[indexPath.row]
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "desCell") as! DescriptionCell
            cell.textLabel?.text = rocket.description
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "launchButtonCell") as! ButtonCell
            cell.launchButton.addTarget(self, action: #selector(openLaunches), for: .touchUpInside)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 1:
            return RocketData.discriptionStrings.count
        default:
            return 1
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header")!
        header.textLabel?.font = .init(name: Fonts.medium, size: 20)
        header.textLabel?.textColor = .init(named: "RedAccentColor")
        header.contentConfiguration = .none
        header.backgroundConfiguration = .clear()
        return header
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 1:
            return "ИНФОРМАЦИЯ:"
        case 2:
            return "ОПИСАНИЕ:"
        default:
            return nil
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 1:
            return 44
        case 2:
            return 44
        default:
            return 0
        }
    }
}
