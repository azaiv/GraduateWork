import Foundation

struct LaunchModel: Codable {
    let id: Int
    let rocket: String
    let name: String
    let date: String
    let location: String
    let result: Bool
}

extension LaunchModel {
    var getFirstFlightDate: String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd MMMM yyyy"
        
        if let date = dateFormatterGet.date(from: date) {
            return dateFormatterPrint.string(from: date)
        } else {
            return "-"
        }
    }
}

