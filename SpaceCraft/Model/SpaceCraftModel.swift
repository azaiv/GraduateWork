//
//  SpaceCraftModel.swift
//  SpaceCraft
//
//  Created by aiv on 20.04.2023.
//

import Foundation

struct SpaceCraftModel: Codable {
    let id: Int
    let name, manufacturer: String
    let noStages: Int
    let noLaunches: Int?
    let length, diameter, startMass: String
    let fuelType: String
    let maxDistance: String
    let status: String
    let description, image: String

    enum CodingKeys: String, CodingKey {
        case id, name, manufacturer
        case noStages = "no_stages"
        case noLaunches = "no_launches"
        case length, diameter
        case startMass = "start_mass"
        case fuelType = "fuel_type"
        case maxDistance = "max_distance"
        case status, description, image
    }
}
