//
//  ListEntities.swift
//  SwiftVIPER


import Foundation

final class ListEntities {

    var channelsList: [ChannelsResponseModelElement] = []

    class ChannelApiState {
        var isFetching = false
    }

    var channelApiState = ChannelApiState()
}
