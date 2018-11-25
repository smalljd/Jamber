//
//  CountdownView.swift
//  Jamber
//
//  Created by Jeff on 11/24/18.
//  Copyright © 2018 Jeff Small. All rights reserved.
//

import UIKit

class CountdownView: UIView {
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var monthsLabel: UILabel!
    @IBOutlet weak var daysLabel: UILabel!
    @IBOutlet weak var hoursLabel: UILabel!
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var secondsLabel: UILabel!

    var countdownDateComponents = [Calendar.Component: Int]()
    var calendar = Calendar(identifier: .gregorian)

    lazy var targetDate: Date = {
        let dateComponents = DateComponents(calendar: calendar, timeZone: TimeZone(abbreviation: "EDT"),
                                            year: 2019, month: 6, day: 1, hour: 4, minute: 30, second: 0)
        return dateComponents.date!
    }()

    func updateComponents() {
        assert(monthsLabel != nil && hoursLabel != nil)

        let dateComponentsUntilWedding = calendar.dateComponents([.month, .day, .hour, .minute, .second], from: Date(), to: targetDate)
        countdownDateComponents[.month] = dateComponentsUntilWedding.month ?? 0
        countdownDateComponents[.day] = dateComponentsUntilWedding.day ?? 0
        countdownDateComponents[.hour] = dateComponentsUntilWedding.hour ?? 0
        countdownDateComponents[.minute] = dateComponentsUntilWedding.minute ?? 0
        countdownDateComponents[.second] = dateComponentsUntilWedding.second ?? 0
    }

    func refreshLabels() {
        updateComponents()

        guard let monthsLeft = countdownDateComponents[.month], let daysLeft = countdownDateComponents[.day], let hoursLeft = countdownDateComponents[.hour],
            let minutesLeft = countdownDateComponents[.minute], let secondsLeft = countdownDateComponents[.second] else {
                assertionFailure("Missing Date Components")
                return
        }

        // Months
        let monthsWord = monthsLeft % 10 == 1 ? "Month" : "Months"
        monthsLabel.text = "\(monthsLeft) \(monthsWord)"

        // Days
        let daysWord = daysLeft % 10 == 1 ? "Day" : "Days"
        daysLabel.text = "\(daysLeft) \(daysWord)"

        // Hours
        let hoursWord = hoursLeft % 10 == 1 ? "Hour" : "Hours"
        hoursLabel.text = "\(hoursLeft) \(hoursWord)"

        // Minutes
        let minutesWord = minutesLeft % 10 == 1 ? "Minute" : "Minutes"
        minutesLabel.text = "\(minutesLeft) \(minutesWord)"

        // Seconds
        let secondsWord = secondsLeft % 10 == 1 ? "Second" : "Seconds"
        secondsLabel.text = "\(secondsLeft) \(secondsWord)"
    }
}

