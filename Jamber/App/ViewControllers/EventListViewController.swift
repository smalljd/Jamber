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
    var timer: Timer?

    override func viewDidLoad() {
        do {
            try dataSource.loadEvents(fromJSONFileNamed: "Events")
        } catch let error {
            assertionFailure("Failed to load Events JSON: \(error.localizedDescription)")
        }

        tableView.dataSource = dataSource
        tableView.tableFooterView = UIView()

        timer = Timer(fire: Date(), interval: 1.0, repeats: true) { [weak self] _ in
            self?.countdownContainerView.refreshLabels()
        }

        if let timer = timer {
            RunLoop.main.add(timer, forMode: RunLoop.Mode.default)
        }
    }
}

