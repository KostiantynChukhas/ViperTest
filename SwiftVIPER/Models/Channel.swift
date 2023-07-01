//
//  Channel.swift
//  SwiftVIPER
//
//  Created by Konstantin Chukhas on 01.07.2023.
//  Copyright © 2023 Tsubasa Hayashi. All rights reserved.
//

import Foundation

class Channel {
    var name: String
    var programs: [Program]?
    
    init(name: String, programs: [Program]?) {
        self.name = name
        self.programs = programs
    }
}
