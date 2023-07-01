//
//  SwiftVIPER


import Foundation
// MARK: - ChannelsResponseModelElement
struct ChannelsResponseModelElement: Codable {
    let orderNum, accessNum: Int
    let callSign: String
    let id: Int

    enum CodingKeys: String, CodingKey {
        case orderNum, accessNum
        case callSign = "CallSign"
        case id
    }
}

typealias ChannelsResponseModel = [ChannelsResponseModelElement]
