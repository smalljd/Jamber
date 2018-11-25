//
//  EventListViewController.swift
//  Jamber
//
//  Created by Jeff on 11/24/18.
//  Copyright © 2018 Jeff Small. All rights reserved.
//

import UIKit

class EventListViewController: UIViewController {
    @IBOutlet weak var countdownContainerView: CountdownView!
    @IBOutlet weak var tableView: UITableView!

    let dataSource = EventsDataSource()

    override func viewDidLoad() {
        do {
            try dataSource.loadEvents(fromJSONFileNamed: "Events")
        } catch let error {
            assertionFailure("Failed to load Events JSON: \(error.localizedDescription)")
        }

        tableView.dataSource = dataSource
        tableView.tableFooterView = UIView()
    }
}

