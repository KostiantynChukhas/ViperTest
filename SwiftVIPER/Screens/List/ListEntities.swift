//
//  ListEntities.swift
//  SwiftVIPER


import Foundation

final class ListEntities {
    var channelsList: [ChannelsResponseModelElement] = []
    var programItemsList: [ProgramItemsResponseModelElement] = []
}

extension ListEntities {
    func getChannels() -> [Channel]? {
        var channelsArray: [Channel] = []
        
        var matchingProgramItemIDs: [Int] = []

        for programItem in programItemsList {
            for channel in channelsList {
                if programItem.recentAirTime.channelID == channel.id {
                    matchingProgramItemIDs.append(programItem.recentAirTime.id)
                    break
                }
            }
        }
        
        var channelPrograms: [(channelName: String, programs: [Program])] = []

        for channel in channelsList {
            var programs: [Program] = []

            for programItem in programItemsList {
                if programItem.recentAirTime.channelID == channel.id {
                    programs.append(Program(title: programItem.name, length: programItem.length, startTime: programItem.startTime))
                }
            }

            if !programs.isEmpty {
                channelPrograms.append((channel.callSign, programs))
            }

        }
        
        for channelProgram in channelPrograms {
            channelsArray.append(Channel(name: channelProgram.channelName, programs: channelProgram.programs))
        }
        
        return channelsArray
    }

    
    func getTimeIntervals() -> [String] {
        return Array(repeating: "", count: 24)
    }
}


