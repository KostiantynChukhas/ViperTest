//
//  DetailEntities.swift
//  SwiftVIPER


import Foundation

struct DetailEntryEntity {
    let channelDetailModel: ChannelsResponseModelElement
    
    init(channelDetailModel: ChannelsResponseModelElement) {
        self.channelDetailModel = channelDetailModel
    }
}

struct DetailEntities {
    let entryEntity: DetailEntryEntity
    var programItemsList: [ProgramItemsResponseModelElement] = []

    init(entryEntity: DetailEntryEntity) {
        self.entryEntity = entryEntity
    }
}
