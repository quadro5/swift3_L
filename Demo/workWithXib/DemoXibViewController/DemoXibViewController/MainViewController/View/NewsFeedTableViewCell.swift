//
//  NewsFeedTableViewCell.swift
//  YHNewFeed
//
//  Created by PSL on 4/12/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import UIKit

class NewsFeedTableViewCell: UITableViewCell {
    // MARK: - View
    @IBOutlet weak var feedCatagoryLabel: UILabel!
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var feedTitleLabel: UILabel!
    @IBOutlet weak var feedSourceLabel: UILabel!
    @IBOutlet weak var feedLikesLabel: UILabel!
    @IBOutlet weak var feedLikesNumLabel: UILabel!
    @IBOutlet weak var feedReactionsLabel: UILabel!
    @IBOutlet weak var feedReactionsNumLabel: UILabel!
}

// MARK: - View LifeCycle
extension NewsFeedTableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        updateUIWithPlaceHolder()
    }
}

// MARK: - Methods
extension NewsFeedTableViewCell {
    func updateUIWithPlaceHolder() {
        feedCatagoryLabel.text = "feedCatagoryLabel"
        feedImageView.contentMode = .scaleAspectFit
        feedImageView.clipsToBounds = true
        feedImageView.image = UIImage(named: "404")
        feedTitleLabel.text = "feedTitleLabel"
        feedSourceLabel.text = "feedSourceLabel"
    }
}
