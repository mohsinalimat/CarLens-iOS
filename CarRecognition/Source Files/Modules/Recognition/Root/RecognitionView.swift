//
//  RecognitionView.swift
//  CarRecognition
//


import UIKit
import ARKit

internal final class RecognitionView: View, ViewSetupable {

    /// Container for augmented reality view controller content
    lazy var augmentedRealityContainer = UIView().layoutable()
    
    /// Cars list button in the left bottom corner
    lazy var carsListButton: UIButton = {
        let view = UIButton(type: .system)
        view.setImage(#imageLiteral(resourceName: "button-car-list-gray"), for: .normal)
        return view.layoutable()
    }()
    
    /// Label with analyzed car model
    lazy var detectedModelLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 18)
        view.textColor = .white
        view.numberOfLines = 0
        view.textAlignment = .center
        return view
    }()
    
    /// Label with time interval of last analyze
    lazy var analyzeTimeLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 14)
        view.textColor = .white
        view.numberOfLines = 0
        view.textAlignment = .center
        return view
    }()
    
    private lazy var modelStackView = UIStackView.make(
        axis: .vertical,
        with: [
            detectedModelLabel,
            analyzeTimeLabel
        ],
        spacing: 5
    ).layoutable()
    
    /// - SeeAlso: ViewSetupable
    func setupViewHierarchy() {
        [augmentedRealityContainer, modelStackView, carsListButton].forEach(addSubview)
    }
    
    /// - SeeAlso: ViewSetupable
    func setupConstraints() {
        augmentedRealityContainer.constraintToSuperviewEdges()
        carsListButton.constraintToConstant(.init(width: 45, height: 45))
        modelStackView.constraintToSuperviewEdges(excludingAnchors: [.top], withInsets: .init(top: 0, left: 8, bottom: 8, right: 8))
        NSLayoutConstraint.activate([
            carsListButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            carsListButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
}