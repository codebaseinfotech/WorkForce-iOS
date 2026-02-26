//
//  MonthStripVC.swift
//  AttendanceSystem
//
//  Created by Ankit on 26/02/26.
//

import UIKit
import HorizonCalendar

final class MonthStripVC: UIViewController {

    private let calendar = Calendar(identifier: .gregorian)
    private let calendarView = CalendarView(initialContent: .empty)

    private var selectedDay = Day(Date())

    private let dayFormatter: DateFormatter = {
        let f = DateFormatter()
        f.calendar = Calendar(identifier: .gregorian)
        f.dateFormat = "EEE"
        return f
    }()

    private let dateFormatter: DateFormatter = {
        let f = DateFormatter()
        f.calendar = Calendar(identifier: .gregorian)
        f.dateFormat = "d"
        return f
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6

        setupCalendar()
        loadCurrentMonth()
    }

    private func setupCalendar() {
        view.addSubview(calendarView)
        calendarView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            calendarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            calendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            calendarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            calendarView.heightAnchor.constraint(equalToConstant: 90)
        ])

        calendarView.daySelectionHandler = { [weak self] (day: Day) in
            guard let self else { return }
            self.selectedDay = day
            self.loadCurrentMonth()
        }
    }

    private func loadCurrentMonth() {

        // Current Month Start & End
        let today = Date()
        let monthInterval = calendar.dateInterval(of: .month, for: today)!
        let startOfMonth = monthInterval.start
        let endOfMonth = monthInterval.end

        let pillProps = PillDayView.InvariantViewProperties(
            cornerRadius: 30,
            borderWidth: 1,
            borderColor: .systemGray4,
            selectedColor: UIColor(red: 0.60, green: 0.36, blue: 0.95, alpha: 1.0),
            dateFont: .systemFont(ofSize: 22, weight: .bold),
            dayFont: .systemFont(ofSize: 14, weight: .semibold),
            dayNormalColor: .systemGray
        )

        var content = CalendarViewContent(
            calendar: calendar,
            visibleDateRange: startOfMonth...endOfMonth,
            monthsLayout: .horizontal(options: .init())
        )
        .interMonthSpacing(0)
        .dayItemSpacing(10)
        .dayOfWeekItemProvider(nil)
        .monthHeaderItemProvider { _ in nil }

        content = content.dayItemProvider { [weak self] day in
            guard let self else { return nil }

            let date = day.components.date(in: self.calendar)!
            let dateText = self.dateFormatter.string(from: date)
            let dayText = self.dayFormatter.string(from: date)

            return CalendarItemModel(
                PillDayView.self,
                invariantViewProperties: pillProps,
                viewModel: .init(
                    dateText: dateText,
                    dayText: dayText,
                    isSelected: day == self.selectedDay
                )
            )
        }

        calendarView.setContent(content)

        // Scroll to selected date
        calendarView.scroll(
            toDayContaining: selectedDay,
            scrollPosition: .centered,
            animated: false
        )
    }
}
