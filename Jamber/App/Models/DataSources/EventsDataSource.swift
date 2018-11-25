//
//  EventsDataSource.swift
//  Jamber
//
//  Created by Jeff on 11/24/18.
//  Copyright © 2018 Jeff Small. All rights reserved.
//

import UIKit

extension JSONDecoder {
    static let `default`: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
}

class EventsDataSource: NSObject, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: EventOverviewCell.self)) as? EventOverviewCell,
            indexPath.item < events.count else {
            return UITableViewCell()
        }

        let viewModel = EventOverviewViewModel(event: events[indexPath.item])
        cell.configureFromViewModel(viewModel)
        cell.borderedImageView.layer.cornerRadius = 30
        cell.borderedImageView.layer.borderColor = UIColor.darkGray.cgColor
        cell.borderedImageView.layer.borderWidth = 3
        return cell
    }

    typealias JSONObject = [String: AnyHashable]
    var events = [Event]()

    func loadEvents(fromJSONFileNamed fileName: String) throws {
        guard let url = Bundle(for: type(of: self)).url(forResource: fileName, withExtension: "json") else {
            assertionFailure("No such JSON.")
            return
        }

        if let eventListDictionary = try JSONSerialization.jsonObject(with: try Data(contentsOf: url), options: []) as? [String: Any],
            let eventsList = eventListDictionary["events"] {
            let eventsData = try JSONSerialization.data(withJSONObject: eventsList, options: [])
            self.events = try JSONDecoder.default.decode([Event].self, from: eventsData)
        }
    }
}
