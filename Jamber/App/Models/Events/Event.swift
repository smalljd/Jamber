//
//  Event.swift
//  Jamber
//
//  Created by Jeff on 11/24/18.
//  Copyright © 2018 Jeff Small. All rights reserved.
//

import UIKit

struct Event: Codable {
    var date: Date
    var description: String
    var fullResolutionImageName: String?
    var location: Location?
    var thumbnailImageName: String?
    var title: String

    enum CodingKeys: String, CodingKey {
        case date
        case description
        case fullResolutionImageName = "full_res_image"
        case location
        case thumbnailImageName = "thumbnail_image"
        case title
    }
}
