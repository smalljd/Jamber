//
//  EventList.swift
//  Jamber
//
//  Created by Jeff on 11/24/18.
//  Copyright © 2018 Jeff Small. All rights reserved.
//

import Foundation

struct EventList: Codable {
    var events: [Event] = []

    enum CodingKeys: String, CodingKey {
        case events
    }
}
