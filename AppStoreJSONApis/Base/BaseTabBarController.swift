//
//  BaseTabBarController.swift
//  AppStoreJSONApis
//
//  Created by HuyHoangPhi on 2/8/19.
//  Copyright © 2019 HuyHoangPhi. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [
            createNavController(viewController: MusicViewController(), title: "Music", imageName: "today_icon"),
            createNavController(viewController: TodayController(), title: "Today", imageName: "today_icon"),
            createNavController(viewController: AppsPageController(), title: "Apps", imageName: "apps"),
            createNavController(viewController: AppsSearchController(), title: "Search", imageName: "search"),
        ]
    }
    
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = .white
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        return navController
        
    }
}


class MusicViewController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let cellID = "TrackCellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(TrackCell.self, forCellWithReuseIdentifier: cellID)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! TrackCell
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5 
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 100)
    }
    
}

class TrackCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
