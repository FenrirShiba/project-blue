//
//  PillView.swift
//  ProjectBlue
//
//  Created by Thiago Nitschke Simões on 19/05/22.
//

#if DEBUG
import SwiftUI
#endif

import UIKit

final class PillView: UIView, ViewCodeConfiguration {

    private lazy var card: UIView = {
       let element = UIView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.backgroundColor = .systemRed
        return element
    }()
    
    private lazy var title: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = .preferredFont(forTextStyle: .caption1).bold()
        element.text = "DG"
        return element
    }()
    
    // MARK: - Auxiliar types
    enum PillType: String {
        case world = "World"
        case hunt = "Hunt"
        case MaskedCarnivale = "Masked"
        case dungeon = "Dungeon"
        case raid = "Raid"
        case trial = "Trial"
        
        func color() -> UIColor {
            switch self {
            case .world:
                return .systemIndigo
            case .hunt:
                return .systemYellow
            case .MaskedCarnivale:
                return .systemBlue
            case .dungeon:
                return .systemPurple
            case .raid:
                return .systemPink
            case .trial:
                return .systemGreen
            }
        }
    }

    init(style: PillType) {
        super.init(frame: .zero)
        
        card.backgroundColor = style.color()
        title.text = style.rawValue
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        card.layer.cornerRadius = 12
    }
    
    func addHierarchy() {
        addSubview(card)
        card.addSubview(title)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            card.heightAnchor.constraint(equalToConstant: 24),
            card.leadingAnchor.constraint(equalTo: leadingAnchor),
            card.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            title.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            title.centerYAnchor.constraint(equalTo: card.centerYAnchor)
        ])
    }
}

#if DEBUG

struct PillContainerView: UIViewRepresentable {
    func makeUIView(context: Context) -> PillView {
        let view = PillView(style: .world)
        view.render()
        return view
    }

    func updateUIView(_ uiView: PillView, context: Context) {}
}

struct PillContainerView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PillContainerView()
                .previewLayout(.fixed(width: 42, height: 24))
                .colorScheme(.light)
            PillContainerView()
                .previewLayout(.fixed(width: 42, height: 24))
                .colorScheme(.dark)
        }
    }
}
#endif
