//
//  SearchResultCell.swift
//  AppStoreJSONApis
//
//  Created by HuyHoangPhi on 2/10/19.
//  Copyright © 2019 HuyHoangPhi. All rights reserved.
//

import UIKit
#warning("Should change rating to million of people")
#warning("Move extension functions to UIView maybe")

class SearchResultCell: UICollectionViewCell {
    
    lazy var appIconImageView = createAppIconImageView()
    lazy var nameLabel = createLabel()
    lazy var categoryLabel: UILabel = createLabel()
    lazy var ratingsLabel: UILabel = createLabel()
    lazy var screenshot1ImageView =  createScreenshotImageView()
    lazy var screenshot2ImageView =  createScreenshotImageView()
    lazy var screenshot3ImageView =  createScreenshotImageView()
    lazy var  getButton: UIButton =  createAppStoreButtons()
    
    var appResult: Result! {
        didSet {
            updateAppInformation()
        }
    }
    
    private func updateAppInformation() {
        nameLabel.text = appResult.trackName
        categoryLabel.text = appResult.primaryGenreName
        ratingsLabel.text = "Rating: \(appResult.averageUserRating ?? 0)"
        let url = URL(string: appResult.artworkUrl100)
        appIconImageView.sd_setImage(with: url)
        updateAppScreenshots()
    }
    
    private func updateAppScreenshots() {
        screenshot1ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls?[0] ?? ""))
        if appResult.screenshotUrls?.count ?? 0 > 1 {
            screenshot2ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls?[1] ?? ""))
        }
        if appResult.screenshotUrls?.count ?? 0 > 2 {
            screenshot3ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls?[2] ?? ""))
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    private func configureUI() {
        ratingsLabel.textColor = .systemGray
        let infoTopStackView = UIStackView(arrangedSubviews: [
               appIconImageView,
               VerticalStackView(arrangedSubviews: [
                   nameLabel, categoryLabel, ratingsLabel
               ]),
               getButton
           ])
           infoTopStackView.spacing = 12
           infoTopStackView.alignment = .center
           let screenshotsStackView = UIStackView(arrangedSubviews: [screenshot1ImageView, screenshot2ImageView, screenshot3ImageView])
           screenshotsStackView.spacing = 12
           screenshotsStackView.distribution = .fillEqually
           let overallStackView = VerticalStackView(arrangedSubviews: [
               infoTopStackView, screenshotsStackView], spacing: 16)
           addSubview(overallStackView)
           overallStackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension SearchResultCell {
    
    func createScreenshotImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        imageView.contentMode = .scaleAspectFill
        return imageView
    }
    
    func createAppStoreButtons() -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        button.layer.cornerRadius = 16
        return button
    }
    
    func createLabel() -> UILabel {
        let label = UILabel()
        label.text = "APP NAME"
        return label
    }
    
    func createAppIconImageView() -> UIImageView {
        let iv = UIImageView()
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        return iv
    }
    
}
