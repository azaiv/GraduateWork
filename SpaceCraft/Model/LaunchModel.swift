//
//  LaunchModel.swift
//  SpaceCraft
//
//  Created by aiv on 26.04.2023.
//

import Foundation

struct LaunchModel: Codable {
    let id: Int
    let name: String
    let date: String
    let location: String
    let result: Bool
}
