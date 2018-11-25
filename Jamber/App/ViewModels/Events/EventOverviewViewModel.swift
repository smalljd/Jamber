//
//  EventOverviewViewModel.swift
//  Jamber
//
//  Created by Jeff on 11/24/18.
//  Copyright © 2018 Jeff Small. All rights reserved.
//

import UIKit

struct EventOverviewViewModel {
    var dateTimeString: String?
    var title: String?
    var locationName: String?
    var image: UIImage?

    init(event: Event) {
        title = event.title
        locationName = event.location?.title ?? event.location?.address
        dateTimeString = DateFormatter.simpleEasternTimeFormatter().string(from: event.date)

        if let thumbnailImage = event.thumbnailImageName {
            image = UIImage(named: thumbnailImage, in: Bundle(for: AppDelegate.self), compatibleWith: nil)
        }
    }
}

extension DateFormatter {
    static func simpleEasternTimeFormatter() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.timeZone = TimeZone(abbreviation: "EDT")
        dateFormatter.dateFormat = "h:mm a"
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        return dateFormatter
    }
}
