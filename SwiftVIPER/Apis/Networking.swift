//
//  GitHubApi.swift
//  SwiftVIPER

import Foundation

struct Networking {
    private static var baseUrl = "https://demo-c.cdn.vmedia.ca"

    struct GetChannelRequest: Request {
        var url: String {
            return baseUrl + "/json/Channels"
        }
        
        func params() -> [(key: String, value: String)] {
            return [ ]
        }
    }
    
    struct GetProgramItemsRequest: Request {
        var url: String {
            return baseUrl + "/json/ProgramItems"
        }
        
        func params() -> [(key: String, value: String)] {
            return [ ]
        }
    }
    
    func programItems(with request: GetProgramItemsRequest, onSuccess: @escaping (ProgramItemsResponseModel) -> Void, onError: @escaping (Error) -> Void) {
        ApiTask().request(.get, request: request, onSuccess: { (data, session) in
            do {
                let response = try self.parseProgramItems(data)
                onSuccess(response)
            } catch {
                onError(ApiError.failedParse)
            }
        }, onError: onError)
    }
    
    func channels(with request: GetChannelRequest, onSuccess: @escaping (ChannelsResponseModel) -> Void, onError: @escaping (Error) -> Void) {
        ApiTask().request(.get, request: request, onSuccess: { (data, session) in
            do {
                let response = try self.parse(data)
                onSuccess(response)
            } catch {
                onError(ApiError.failedParse)
            }
        }, onError: onError)
    }

    private func parse(_ data: Data) throws -> ChannelsResponseModel {
        let response: ChannelsResponseModel = try JSONDecoder().decode(ChannelsResponseModel.self, from: data)
        return response
    }
    
    private func parseProgramItems(_ data: Data) throws -> ProgramItemsResponseModel {
        let response: ProgramItemsResponseModel = try JSONDecoder().decode(ProgramItemsResponseModel.self, from: data)
        return response
    }
}
