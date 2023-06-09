import Foundation

struct RocketModel: Codable {
    let id: Int
    let name, manufacturer: String
    let noStages: Int
    let noLaunches: Int?
    let length, diameter, startMass: String
    let fuelType: String
    let status: String
    let description, image: String

    enum CodingKeys: String, CodingKey {
        case id, name, manufacturer
        case noStages = "no_stages"
        case noLaunches = "no_launches"
        case length, diameter
        case startMass = "start_mass"
        case fuelType = "fuel_type"
        case status, description, image
    }
}

