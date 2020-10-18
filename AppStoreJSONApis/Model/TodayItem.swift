//
//  TodayItem.swift
//  AppStoreJSONApis
//
//  Created by HuyHoangPhi on 3/1/19.
//  Copyright © 2019 HuyHoangPhi. All rights reserved.
//

import UIKit

struct TodayItem {
    
    let category: String
    let title: String
    let image: UIImage
    let description: String
    let backgroundColor: UIColor
    
    let cellType: CellType
    
    let apps: [FeedResult]
    
    enum CellType: String {
        case single, multiple
    }
    
}
