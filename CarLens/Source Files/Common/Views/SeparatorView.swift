//
//  SeparatorView.swift
//  CarLens
//


import UIKit

/// Empty separator view, mainly for UIStackView
final class SeparatorView: View {

    private let axis: NSLayoutConstraint.Axis

    private let thickness: CGFloat

    /// Initialize an view
    ///
    /// - Parameters:
    ///     - axis: The axis of the separator view.
    ///     - thickness: The thickness of the separator view.
    ///     - color: The background color of the separator view. Transparent by default
    init(axis: NSLayoutConstraint.Axis, thickness: CGFloat, color: UIColor = .clear) {
        self.axis = axis
        self.thickness = thickness
        super.init()
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = color
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: axis == .horizontal ? thickness : 0, height: axis == .vertical ? thickness : 0)
    }
}

extension UIView {

    /// Initialize an separator view
    ///
    /// - Parameters:
    ///     - axis: The axis of the separator view.
    ///     - thickness: The thickness of the separator view.
    ///     - color: The background color of the separator view. Transparent by default
    static func separator(axis: NSLayoutConstraint.Axis, thickness: CGFloat, color: UIColor = .clear) -> UIView {
        return SeparatorView(axis: axis, thickness: thickness, color: color)
    }
}
