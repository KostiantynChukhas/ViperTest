//
//  ProgramItemsResponseModel.swift
//  SwiftVIPER


import Foundation
// MARK: - ProgramItemsResponseModelElement
struct ProgramItemsResponseModelElement: Codable {
    let startTime: String
    let recentAirTime: RecentAirTime
    let length: Int
    let name: String
}

// MARK: - RecentAirTime
struct RecentAirTime: Codable {
    let id, channelID: Int
}

extension ProgramItemsResponseModelElement {
    func getTime() -> String {
        let dateFormatter = ISO8601DateFormatter()
        guard let date = dateFormatter.date(from: startTime) else { return "" }
        let formatter = DateFormatter()
        formatter.dateFormat = "d.MM HH:mm"
        return formatter.string(from: date)
    }
}

typealias ProgramItemsResponseModel = [ProgramItemsResponseModelElement]

