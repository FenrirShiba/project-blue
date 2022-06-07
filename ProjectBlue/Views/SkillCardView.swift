import Foundation


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

final class SkillAcquireCardView: UIView, ViewCodeConfiguration {
    
    // View Code Properties
    private lazy var stack: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.layer.cornerRadius = 8
        element.backgroundColor = .systemGray5
        element.alignment = .center
        element.axis = .horizontal
        element.distribution = .fillProportionally
        element.spacing = 16
        element.isLayoutMarginsRelativeArrangement = true
        element.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 12,
                                                                   leading: 12,
                                                                   bottom: 12,
                                                                   trailing: 12)
        return element
    }()
    
    private lazy var pillStack: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.alignment = .center
        element.axis = .vertical
        element.distribution = .fill
        element.spacing = 8
        element.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        element.setContentCompressionResistancePriority(.required, for: .horizontal)
        return element
    }()
    
    private lazy var typePill: PillView = {
        let element = PillView(style: .hunt)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var levelLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.textColor = .label
        element.textAlignment = .left
        element.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        element.font = .preferredFont(forTextStyle: .caption1)
        element.textColor = .secondaryLabel
        element.numberOfLines = 2
        return element
    }()

    private lazy var infoStack: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.alignment = .fill
        element.axis = .vertical
        element.distribution = .fill
        element.spacing = 8
        element.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return element
    }()
    
    private lazy var nameMonsterLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.textColor = .label
        element.textAlignment = .left
        element.font = .preferredFont(forTextStyle: .headline)
        element.numberOfLines = 2
        return element
    }()
    
    private lazy var typeMonsterLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.textColor = .label
        element.textAlignment = .left
        element.font = .preferredFont(forTextStyle: .callout)
        element.numberOfLines = 2
        return element
    }()
    
    private lazy var locationMonsterLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.textColor = .label
        element.textAlignment = .left
        element.font = .preferredFont(forTextStyle: .footnote)
        element.numberOfLines = 2
        return element
    }()
    
    // MARK: - Constructors
    init(name: String,
         type: String,
         location: String,
         pillLocation: PillType,
         pillLevel: String) {
        super.init(frame: .zero)
        
        nameMonsterLabel.text = name
        typeMonsterLabel.text = type
        locationMonsterLabel.text = location
        typePill.style = pillLocation
        levelLabel.text = pillLevel
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Code Functions
    func addHierarchy() {
        addSubview(stack)
        
        stack.addArrangedSubview(pillStack)
        stack.addArrangedSubview(infoStack)
      
        pillStack.addArrangedSubview(typePill)
        pillStack.addArrangedSubview(levelLabel)
        
        infoStack.addArrangedSubview(nameMonsterLabel)
        infoStack.addArrangedSubview(typeMonsterLabel)
        infoStack.addArrangedSubview(locationMonsterLabel)
        
        
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: topAnchor),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            infoStack.widthAnchor.constraint(equalToConstant: 242),
            
            typePill.heightAnchor.constraint(equalToConstant: 24),
            typePill.widthAnchor.constraint(equalToConstant: 61)
        ])
    }
    
    func additionalProperties() {
        backgroundColor = .systemBackground
        typePill.render()
    }
}

#if DEBUG

struct SkillAcquireCardContainerView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = SkillAcquireCardView(name: "ADS",
                                        type: "Boss",
                                        location: "The Binding Coil of Bahamut - Turn 1",
                                        pillLocation: .trial,
                                        pillLevel: "Lvl - 50")
        view.render()
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}

struct SkillAcquireCardContainerView2: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = SkillAcquireCardView(name: "ADS",
                                        type: "Boss",
                                        location: "The Binding Coil of Bahamut - Turn 1",
                                        pillLocation: .dungeon,
                                        pillLevel: "Lvl - 50")
        view.render()
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}

struct SkillAcquireCardContainerView3: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = SkillAcquireCardView(name: "ADS",
                                        type: "Boss",
                                        location: "The Binding Coil of Bahamut - Turn 1, The Binding Coil of Bahamut - Turn 1",
                                        pillLocation: .maskedCarnivale,
                                        pillLevel: "Lvl - 50")
        view.render()
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}

struct SkillAcquireCardContainerView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SkillAcquireCardContainerView2()
                .previewLayout(.fixed(width: 375, height: 120))
            SkillAcquireCardContainerView3()
                .previewLayout(.fixed(width: 375, height: 120))
            SkillAcquireCardContainerView()
                .previewLayout(.fixed(width: 375, height: 120))
                .colorScheme(.light)
            SkillAcquireCardContainerView()
                .previewLayout(.fixed(width: 375, height: 120))
                .colorScheme(.dark)
        }
    }
}
#endif

