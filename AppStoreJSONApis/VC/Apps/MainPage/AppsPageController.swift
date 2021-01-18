//
//  AppsController.swift
//  AppStoreJSONApis
//
//  Created by  on 2/14/19.
//  Copyright © 2019 . All rights reserved.
//

import UIKit

#warning("refactor activity IndicatorView")


class AppsPageController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    private let cellId = "id"
    private let headerId = "headerId"
    var socialApps = [SocialApp]()
    var groups = [AppGroup]()
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView(style: .whiteLarge)
        aiv.color = .black
        aiv.startAnimating()
        aiv.hidesWhenStopped = true
        return aiv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        fetchData()
    }
    
    private func configureUI() {
        configureCollectionView()
        view.addSubview(activityIndicatorView)
        activityIndicatorView.fillSuperview()
    }
    
    private func configureCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(AppPageHorizontalCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! AppPageHorizontalCell
        header.appHeaderHorizontalController.socialApps = self.socialApps
        header.appHeaderHorizontalController.collectionView.reloadData()
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 0, right: 0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsGroupCell
        let appGroup = groups[indexPath.item]
        configureCellForHorizontalController(cell, appGroup)
        return cell
    }
    
    private func configureCellForHorizontalController(_ cell: AppsGroupCell, _ appGroup: AppGroup) {
        cell.titleLabel.text = appGroup.feed.title
        cell.horizontalController.appGroup = appGroup
        cell.horizontalController.collectionView.reloadData()
        cell.horizontalController.didSelectHandler = { [weak self] feedResult in
             let controller = AppDetailController(appId: feedResult.id)
             controller.navigationItem.title = feedResult.name
             self?.navigationController?.pushViewController(controller, animated: true)
         }
    }
}

// MARK: -- FETCHING DATA
extension AppsPageController {
    
    fileprivate func fetchData() {
        
        var group1: AppGroup?
        var group2: AppGroup?
        var group3: AppGroup?
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        Service.shared.fetchGames { (appGroup, err) in
            dispatchGroup.leave()
            group1 = appGroup
        }
        dispatchGroup.enter()
        Service.shared.fetchTopGrossing { (appGroup, err) in
            dispatchGroup.leave()
            group2 = appGroup
        }
        dispatchGroup.enter()
        Service.shared.fetchAppGroup(urlString: "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/all/25/explicit.json") { (appGroup, err) in
            dispatchGroup.leave()
            group3 = appGroup
        }
        dispatchGroup.enter()
        Service.shared.fetchSocialApps { [weak self] (apps, err)in
            #warning("you should check the err")
            dispatchGroup.leave()
            guard let self = self else {return}
            self.socialApps = apps ?? []
        }
        
        dispatchGroup.notify(queue: .main) {
            self.activityIndicatorView.stopAnimating()
            if let group = group1 {
                self.groups.append(group)
            }
            if let group = group2 {
                self.groups.append(group)
            }
            if let group = group3 {
                self.groups.append(group)
            }
            self.collectionView.reloadData()
        }
    }
}
