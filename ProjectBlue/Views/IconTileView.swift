//
//  IconTileView.swift
//  ProjectBlue
//
//  Created by Thiago Nitschke Simões on 03/05/22.
//

#if DEBUG
import SwiftUI
#endif

import UIKit

final class IconTileView: UIView, ViewCodeConfiguration {
    
    // MARK: - Properties
    public var text: String? {
        didSet {
            valueLabel.text = text
        }
    }
    
    public var descriptionText: String? {
        didSet {
            descriptionLabel.text = descriptionText
        }
    }
    
    private var fontTextStyle: UIFont.TextStyle
    
    // View Code Properties
    private lazy var stack: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.alignment = .fill
        element.axis = .horizontal
        element.distribution = .fill
        element.spacing = 8
        element.isBaselineRelativeArrangement = true
        return element
    }()
    
    private lazy var icon: UIImageView = {
        let element = UIImageView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.contentMode = .left
        element.tintColor = .systemGray
        element.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        element.setContentCompressionResistancePriority(.required, for: .horizontal)
        return element
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = .preferredFont(forTextStyle: fontTextStyle)
        element.textColor = .systemGray
        element.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        element.setContentCompressionResistancePriority(.required, for: .horizontal)
        return element
    }()
    
    private lazy var valueLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.setContentHuggingPriority(.defaultLow, for: .horizontal)
        element.textColor = .label
        element.textAlignment = .left
        element.font = .preferredFont(forTextStyle: fontTextStyle)
        element.numberOfLines = 2
        return element
    }()
    
    // MARK: - Constructors
    init(iconName: String? = nil,
         description: String? = nil,
         value: String,
         preferedFont: UIFont.TextStyle = .subheadline) {
        
        fontTextStyle = preferedFont
        super.init(frame: .zero)
        
        if let iconName = iconName,
           let image = UIImage(systemName: iconName) {
            icon.image = image
            icon.isHidden = false
        } else {
            icon.isHidden = true
        }
        
        if let description = description {
            descriptionLabel.text = description
            descriptionLabel.isHidden = false
        } else {
            descriptionLabel.isHidden = true
        }
        
        valueLabel.text = value
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Code Functions
    func addHierarchy() {
        addSubview(stack)
        
        stack.addArrangedSubview(icon)
        stack.addArrangedSubview(descriptionLabel)
        stack.addArrangedSubview(valueLabel)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: topAnchor),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
    }
    
    func additionalProperties() {
        backgroundColor = .systemBackground
    }
}

#if DEBUG

struct IconTileContainerView: UIViewRepresentable {
    func makeUIView(context: Context) -> IconTileView {
        let view = IconTileView(iconName: "star.circle",
                                description: "Rank:",
                                value: "★★★★★")
        view.render()
        return view
    }

    func updateUIView(_ uiView: IconTileView, context: Context) {}
}

struct IconTileContainerView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            IconTileContainerView()
                .previewLayout(.fixed(width: 375, height: 44))
                .colorScheme(.light)
            IconTileContainerView()
                .previewLayout(.fixed(width: 375, height: 44))
                .colorScheme(.dark)
        }
    }
}
#endif

