import Foundation

enum RocketData {
    static let rocketsData = Bundle.main.decode([RocketModel].self, from: "RocketJSON.json")
    static let launchesData = Bundle.main.decode([LaunchModel].self, from: "LaunchJSON.json")
    static let discriptionStrings = ["Производитель", "Количество ступеней", "Длина", "Диаметр", "Масса", "Топливо", "Статус", "Количество запусков"]
}
