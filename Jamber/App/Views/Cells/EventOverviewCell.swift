//
//  EventOverviewCell.swift
//  Jamber
//
//  Created by Jeff on 11/25/18.
//  Copyright © 2018 Jeff Small. All rights reserved.
//

import UIKit

class EventOverviewCell: UITableViewCell {
    @IBOutlet weak var borderedImageView: BorderedImageView!
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var eventTitleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!

    func configureFromViewModel(_ viewModel: EventOverviewViewModel) {
        borderedImageView.image = viewModel.image
        dateTimeLabel.text = viewModel.dateTimeString
        eventTitleLabel.text = viewModel.title
        locationLabel.text = viewModel.locationName
    }
}
