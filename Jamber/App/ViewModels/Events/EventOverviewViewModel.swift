//
//  EventOverviewViewModel.swift
//  Jamber
//
//  Created by Jeff on 11/24/18.
//  Copyright © 2018 Jeff Small. All rights reserved.
//

import UIKit

struct EventOverviewViewModel {
    var title: String?
    var subtitle: String?
    var image: UIImage?

    init(event: Event) {
        title = event.title
        subtitle = event.location?.title ?? event.location?.address

        if let thumbnailImage = event.thumbnailImageName {
            image = UIImage(named: thumbnailImage, in: Bundle(for: AppDelegate.self), compatibleWith: nil)
        }
    }
}
