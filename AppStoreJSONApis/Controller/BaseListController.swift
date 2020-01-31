//
//  BaseListController.swift
//  AppStoreJSONApis
//
//  Created by HuyHoangPhi on 2/14/19.
//  Copyright © 2019 HuyHoangPhi. All rights reserved.
//

import UIKit

class BaseListController: UICollectionViewController {
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
