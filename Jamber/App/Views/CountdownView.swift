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
    @IBOutlet weak var monthsTextLabel: UILabel!
    @IBOutlet weak var monthsNumberLabel: UILabel!
    @IBOutlet weak var daysTextLabel: UILabel!
    @IBOutlet weak var daysNumberLabel: UILabel!
    @IBOutlet weak var hoursTextLabel: UILabel!
    @IBOutlet weak var hoursNumberLabel: UILabel!
    @IBOutlet weak var minutesTextLabel: UILabel!
    @IBOutlet weak var minutesNumberLabel: UILabel!
    @IBOutlet weak var secondsTextLabel: UILabel!
    @IBOutlet weak var secondsNumberLabel: UILabel!

    var countdownDateComponents = [Calendar.Component: Int]()
    var calendar = Calendar(identifier: .gregorian)

    lazy var targetDate: Date = {
        let dateComponents = DateComponents(calendar: calendar, timeZone: TimeZone(abbreviation: "EDT"),
                                            year: 2019, month: 6, day: 1, hour: 4, minute: 30, second: 0)
        return dateComponents.date!
    }()

    override func awakeFromNib() {
        super.awakeFromNib()

        let timer = Timer(fire: Date(), interval: 1.0, repeats: true) { [weak self] _ in
            self?.refreshLabels()
        }

        RunLoop.main.add(timer, forMode: RunLoop.Mode.default)
    }

    func updateComponents() {
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

        assert(monthsTextLabel != nil && hoursTextLabel != nil)

        // Months
        let monthsWord = monthsLeft % 10 == 1 ? "Month" : "Months"
        monthsTextLabel.text = "\(monthsWord)"
        monthsNumberLabel.text = "\(monthsLeft)"

        // Days
        let daysWord = daysLeft % 10 == 1 ? "Day" : "Days"
        daysTextLabel.text = "\(daysWord)"
        daysNumberLabel.text = "\(daysLeft)"

        // Hours
        let hoursWord = hoursLeft % 10 == 1 ? "Hour" : "Hours"
        hoursTextLabel.text = "\(hoursWord)"
        hoursNumberLabel.text = "\(hoursLeft)"

        // Minutes
        let minutesWord = minutesLeft % 10 == 1 ? "Minute" : "Minutes"
        minutesTextLabel.text = "\(minutesWord)"
        minutesNumberLabel.text = "\(minutesLeft)"

        // Seconds
        let secondsWord = secondsLeft % 10 == 1 ? "Second" : "Seconds"
        secondsTextLabel.text = "\(secondsWord)"
        secondsNumberLabel.text = "\(secondsLeft)"
    }
}

