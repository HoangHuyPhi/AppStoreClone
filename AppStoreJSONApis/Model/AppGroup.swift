//
//  AppGroup.swift
//  AppStoreJSONApis
//
//  Created by HuyHoangPhi on 2/15/19.
//  Copyright © 2019 HuyHoangPhi. All rights reserved.
//

import Foundation

struct AppGroup: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let results: [FeedResult]
}

struct FeedResult: Decodable {
    let id, name, artistName, artworkUrl100: String
}
