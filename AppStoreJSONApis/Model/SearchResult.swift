//
//  SearchResult.swift
//  AppStoreJSONApis
//
//  Created by HuyHoangPhi on 2/11/19.
//  Copyright © 2019 HuyHoangPhi. All rights reserved.
//

import Foundation

struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Result]
}

struct Result: Decodable {
    let trackId: Int
    let trackName: String
    let primaryGenreName: String
    var averageUserRating: Float?
    let screenshotUrls: [String]
    let artworkUrl100: String // app icon
    var formattedPrice: String?
    let description: String
    var releaseNotes: String?
}


