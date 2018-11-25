//
//  EventsDataSourceTests.swift
//  JamberTests
//
//  Created by Jeff on 11/24/18.
//  Copyright © 2018 Jeff Small. All rights reserved.
//

import XCTest
@testable import Jamber

class EventsDataSourceTests: XCTestCase {
    func testLoadingJSONInDataSource() {
        let dataSource = EventsDataSource()

        do {
            try dataSource.loadEvents(fromJSONFileNamed: "Events")
        } catch let error {
            XCTFail("Failed to load the Events.json file: \(error.localizedDescription)")
            return
        }

        XCTAssertEqual(dataSource.events.count, 4)
        let sortedEvents = dataSource.events.sorted { $0.date < $1.date }

        XCTAssertEqual(sortedEvents.first?.title, "Wedding Ceremony")
    }
}
