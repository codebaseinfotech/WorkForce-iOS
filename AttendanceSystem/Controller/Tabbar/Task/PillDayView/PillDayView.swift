//
//  PillDayView.swift
//  AttendanceSystem
//
//  Created by Ankit on 24/02/26.
//

import UIKit
import HorizonCalendar

final class PillDayView: UIView, CalendarItemViewRepresentable {

    struct InvariantViewProperties: Hashable {
        let cornerRadius: CGFloat
        let borderWidth: CGFloat
        let borderColor: UIColor
        let selectedColor: UIColor
        let dateFont: UIFont
        let dayFont: UIFont
        let dayNormalColor: UIColor
    }

    struct ViewModel: Hashable {
        let dateText: String
        let dayText: String
        let isSelected: Bool
    }

    static func makeView(withInvariantViewProperties props: InvariantViewProperties) -> PillDayView {
        PillDayView(props: props)
    }

    static func setViewModel(_ viewModel: ViewModel, on view: PillDayView) {
        view.apply(viewModel)
    }

    // MARK: UI
    private let props: InvariantViewProperties
    private let pill = UIView()
    private let lblDate = UILabel()
    private let lblDay = UILabel()

    private init(props: InvariantViewProperties) {
        self.props = props
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    private func setup() {
        backgroundColor = .clear

        addSubview(pill)
        pill.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pill.leadingAnchor.constraint(equalTo: leadingAnchor),
            pill.trailingAnchor.constraint(equalTo: trailingAnchor),
            pill.topAnchor.constraint(equalTo: topAnchor),
            pill.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        pill.layer.cornerRadius = props.cornerRadius
        pill.layer.borderWidth = props.borderWidth
        pill.layer.borderColor = props.borderColor.cgColor
        pill.backgroundColor = .white

        lblDate.font = props.dateFont
        lblDate.textAlignment = .center

        lblDay.font = props.dayFont
        lblDay.textAlignment = .center

        let stack = UIStackView(arrangedSubviews: [lblDate, lblDay])
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 4

        pill.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: pill.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: pill.centerYAnchor)
        ])
    }

    private func apply(_ vm: ViewModel) {
        lblDate.text = vm.dateText
        lblDay.text = vm.dayText

        if vm.isSelected {
            pill.backgroundColor = props.selectedColor
            pill.layer.borderColor = UIColor.clear.cgColor
            lblDate.textColor = .white
            lblDay.textColor = .white
        } else {
            pill.backgroundColor = .white
            pill.layer.borderColor = props.borderColor.cgColor
            lblDate.textColor = .label
            lblDay.textColor = props.dayNormalColor
        }
    }
}
