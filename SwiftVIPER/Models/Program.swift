//
//  Program.swift
//  SwiftVIPER
//
//  Created by Konstantin Chukhas on 01.07.2023.
//  Copyright © 2023 Tsubasa Hayashi. All rights reserved.
//

import Foundation

class Program {
    var title: String
    var length: Int
    var startTime: String
    
    init(title: String, length: Int, startTime: String) {
        self.title = title
        self.length = length
        self.startTime = startTime
    }
}

extension Program {
    func getTime() -> String {
        let isoFormatter = ISO8601DateFormatter()
        guard let date = isoFormatter.date(from: startTime) else { return "" }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM HH:mm:ss"
        return dateFormatter.string(from: date)
    }
}
