//
//  ButtonsViewController.swift
//  UIKit Catalyst Buttons
//
//  Created by Dylan McDonald on 4/1/25.
//

import UIKit

class ButtonsViewController: UIViewController {
    
    var grayButton = UIButton()
    var destructiveButton = UIButton()
    var textOnlyButton = UIButton()
    var properMacAccentButton = UIButton()
    var darkMacAccentButton = UIButton()
    var darkPrimaryMacAccentButton = UIButton()
    var darkColorfulButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        self.view.backgroundColor = .clear
    }
    
    func setupView() {
        // MARK: Stack View
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
        ])
        
        
        // MARK: Gray Button
        var grayConfig = UIButton.Configuration.gray()
        grayConfig.cornerStyle = .medium
        grayConfig.title = "Gray Button"
        
        grayButton = UIButton(configuration: grayConfig)
        grayButton.isPointerInteractionEnabled = true
        grayButton.translatesAutoresizingMaskIntoConstraints = false
        grayButton.preferredBehavioralStyle = .mac
        stackView.addArrangedSubview(grayButton)
        
        grayButton.tintColor = .tintColor
        grayButton.role = .normal
        grayButton.controlSize = .large
        
        
        // MARK: Destructive Button
        var grayDescructiveConfig = UIButton.Configuration.gray()
        grayDescructiveConfig.cornerStyle = .medium
        grayDescructiveConfig.title = "Destructive Button"
        // Required for red text
        grayDescructiveConfig.baseForegroundColor = .systemRed
        
        destructiveButton = UIButton(configuration: grayDescructiveConfig)
        destructiveButton.isPointerInteractionEnabled = true
        destructiveButton.translatesAutoresizingMaskIntoConstraints = false
        destructiveButton.preferredBehavioralStyle = .mac
        stackView.addArrangedSubview(destructiveButton)
        
        destructiveButton.tintColor = .systemRed
        // Required for red text
        destructiveButton.role = .destructive
        destructiveButton.controlSize = .large
        
        
        // MARK: Proper Mac Accent Button
        var properMacAccentConfig = UIButton.Configuration.bordered()
        // Or .gray
        properMacAccentConfig.cornerStyle = .medium
        properMacAccentConfig.title = "Mac Accent Color Button"
        
        properMacAccentButton = UIButton(configuration: properMacAccentConfig)
        properMacAccentButton.isPointerInteractionEnabled = true
        properMacAccentButton.translatesAutoresizingMaskIntoConstraints = false
        properMacAccentButton.preferredBehavioralStyle = .mac
        stackView.addArrangedSubview(properMacAccentButton)
        
        properMacAccentButton.tintColor = .accent // Has no effect
        properMacAccentButton.role = .primary // Required for colorful background
        properMacAccentButton.controlSize = .large
        
        
        
        // MARK: Dark Mac Accent Button
        var darkMacAccentConfig = UIButton.Configuration.filled()
        darkMacAccentConfig.cornerStyle = .medium
        darkMacAccentConfig.title = "Darker Button (Mac Accent Color)"
        
        darkMacAccentButton = UIButton(configuration: darkMacAccentConfig)
        darkMacAccentButton.isPointerInteractionEnabled = true
        darkMacAccentButton.translatesAutoresizingMaskIntoConstraints = false
        darkMacAccentButton.preferredBehavioralStyle = .mac
        stackView.addArrangedSubview(darkMacAccentButton)
        
        darkMacAccentButton.tintColor = .tintColor // = Mac Accent Color when running in Catalyst
        darkMacAccentButton.role = .normal
        darkMacAccentButton.controlSize = .large
        darkMacAccentButton.setBezelColor(.accent) // Does nothing
        
        
        // MARK: Dark Colorful Button
        // Same as above, but with custom tintColor
        var darkColorfulConfig = UIButton.Configuration.filled()
        darkColorfulConfig.cornerStyle = .medium
        darkColorfulConfig.title = "Darker Button NORMAL (Custom Color)"
        //        darkColorfulConfig.baseBackgroundColor = .accent // HAS NO EFFECT
        
        darkColorfulButton = UIButton(configuration: darkColorfulConfig)
        darkColorfulButton.isPointerInteractionEnabled = true
        darkColorfulButton.translatesAutoresizingMaskIntoConstraints = false
        darkColorfulButton.preferredBehavioralStyle = .mac
        stackView.addArrangedSubview(darkColorfulButton) // Does nothing
        
        darkColorfulButton.tintColor = .accent // Works with ANY color
        darkColorfulButton.role = .normal
        darkColorfulButton.controlSize = .large
        darkColorfulButton.setBezelColor(.accent)
        
        
        
        // MARK: Text Only Button
        var tintedConfig = UIButton.Configuration.tinted()
        // Or .plain
        tintedConfig.cornerStyle = .medium
        tintedConfig.title = "Text Only Button (Custom Color)"
        
        textOnlyButton = UIButton(configuration: tintedConfig)
        textOnlyButton.isPointerInteractionEnabled = true
        textOnlyButton.translatesAutoresizingMaskIntoConstraints = false
        textOnlyButton.preferredBehavioralStyle = .mac
        stackView.addArrangedSubview(textOnlyButton)
        
        textOnlyButton.tintColor = .accent // Works with ANY color
        textOnlyButton.role = .primary
        textOnlyButton.controlSize = .large
    }


}

