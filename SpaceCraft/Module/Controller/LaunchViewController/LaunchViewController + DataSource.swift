import UIKit

extension LaunchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return launchArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
}
