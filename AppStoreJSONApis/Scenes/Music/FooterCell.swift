//
//  FooterCell.swift
//  AppStoreJSONApis
//
//  Created by Phi Hoang Huy on 10/27/20.
//  Copyright © 2020 Brian Voong. All rights reserved.
//

import UIKit

class MusicLoadingFooter: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createLoadingView()
    }
    
    private func createLoadingView() {
        let aiv = UIActivityIndicatorView(style: .whiteLarge)
        aiv.color = .darkGray
        aiv.startAnimating()
        let label = UILabel(text: "Loading more...", font: .systemFont(ofSize: 16))
        label.textAlignment = .center
        let stackView = VerticalStackView(arrangedSubviews: [
            aiv, label
            ], spacing: 8)
        addSubview(stackView)
        stackView.centerInSuperview(size: .init(width: 200, height: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}
