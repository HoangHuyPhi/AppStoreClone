//
//  AppFullscreenHeaderCell.swift
//  AppStoreJSONApis
//
//  Created by HuyHoangPhi on 2/28/19.
//  Copyright © 2019 HuyHoangPhi. All rights reserved.
//

import UIKit

class AppFullscreenHeaderCell: UITableViewCell {
    
    let todayCell = TodayCell()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(todayCell)
        todayCell.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}
