//
//  SkillSheetController.swift
//  ProjectBlue
//
//  Created by Thiago Nitschke Simões on 28/04/22.
//

#if DEBUG
import SwiftUI
#endif

import UIKit

final class SkillSheetController: UIViewController, ViewCodeConfiguration {
    
    static func instantiate() -> SkillSheetController {
        return SkillSheetController()
    }
    
    // View Code Properties
    private lazy var verticalStack: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.alignment = .fill
        element.axis = .vertical
        element.distribution = .fill
        element.spacing = 16
        return element
    }()
    
    private lazy var headerStack: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.alignment = .fill
        element.axis = .horizontal
        element.distribution = .fill
        element.spacing = 16
        element.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return element
    }()
    
    private lazy var informationStack: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.alignment = .fill
        element.axis = .vertical
        element.distribution = .fill
        element.spacing = 16
        element.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        return element
    }()
    
    private lazy var acquireStack: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.alignment = .top
        element.axis = .vertical
        element.distribution = .fill
        element.spacing = 4
        element.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return element
    }()
    
    private lazy var pinStack: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.alignment = .center
        element.axis = .horizontal
        element.distribution = .fill
        element.spacing = 12
        element.isLayoutMarginsRelativeArrangement = true
        element.layoutMargins = UIEdgeInsets(top: 4,
                                             left: 4,
                                             bottom: 4,
                                             right: 4)
        return element
    }()
    
    private lazy var lineView: UIView = {
        let element = UIView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.backgroundColor = .systemGray6
        element.layer.cornerRadius = 2
        return element
    }()
    
    private lazy var dungeonsStack: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.alignment = .fill
        element.axis = .vertical
        element.distribution = .fill
        element.spacing = 12
        element.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return element
    }()
    
    private lazy var numberView: IconTileView = {
        let element = IconTileView(iconName: "list.number",
                                   description: "Number: ",
                                   value: "2",
                                   preferedFont: .headline)
        return element
    }()
    
    private lazy var rankView: IconTileView = {
        let element = IconTileView(iconName: "star.circle",
                                   description: "Rank:",
                                   value: "4",
                                   preferedFont: .headline)
        return element
    }()
    
    private lazy var levelView: IconTileView = {
        let element = IconTileView(iconName: "bookmark.fill",
                                   description: "Level:",
                                   value: "50 or 70",
                                   preferedFont: .headline)
        return element
    }()
    
    private lazy var skillImageView: UIImageView = {
        let element = UIImageView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.image = UIImage(named: "flameThrower")
        element.contentMode = .topRight
        element.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return element
    }()
    
    private lazy var pinView: UIImageView = {
        let element = UIImageView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.image = UIImage(systemName: "pin.fill")
        element.contentMode = .left
        element.tintColor = .systemGray
        element.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return element
    }()
    
    private lazy var spacerStack: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.alignment = .fill
        element.axis = .vertical
        element.distribution = .fill
        element.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return element
    }()
    
    private lazy var bookmarkButton: UIButton = {
        let element = UIButton(type: .roundedRect)
        element.translatesAutoresizingMaskIntoConstraints = false
        element.layer.cornerRadius = 10
        element.setTitle(" Check List", for: .normal)
        let icon = UIImage(systemName: "bookmark.fill")
        element.setImage(icon, for: .normal)
        element.titleLabel?.font = .preferredFont(forTextStyle: .headline).bold()
        element.backgroundColor = .systemBlue.withAlphaComponent(0.15)
        element.tintColor = .systemBlue
        return element
    }()
    
    // MARK: - View lifecycle
    override func loadView() {
        super.loadView()
        render()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if #available(iOS 13.0, *) {
            DispatchQueue.main.async {
                self.navigationController?.navigationBar.setNeedsLayout()
            }
        }
    }
    
    // MARK: - View Code Functions
    func addHierarchy() {
        view.addSubview(verticalStack)
        
        verticalStack.addArrangedSubview(headerStack)
        verticalStack.addArrangedSubview(acquireStack)
        
        headerStack.addArrangedSubview(informationStack)
        informationStack.addArrangedSubview(numberView)
        informationStack.addArrangedSubview(rankView)
        informationStack.addArrangedSubview(levelView)
        headerStack.addArrangedSubview(skillImageView)
        
        acquireStack.addArrangedSubview(pinStack)
        pinStack.addArrangedSubview(pinView)
        pinStack.addArrangedSubview(lineView)
        
        acquireStack.addArrangedSubview(dungeonsStack)
        acquireStack.addArrangedSubview(spacerStack)
        verticalStack.addArrangedSubview(bookmarkButton)
        
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            verticalStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            verticalStack.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            verticalStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            verticalStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            
            pinStack.heightAnchor.constraint(lessThanOrEqualToConstant: 30),
            
            lineView.heightAnchor.constraint(equalToConstant: 4),
            lineView.widthAnchor.constraint(equalTo: view.widthAnchor,
                                            constant: -72),
            
            bookmarkButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    func additionalProperties() {
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
        
        numberView.render()
        rankView.render()
        levelView.render()
    }
    
    func makeCard(name: String,
                  type: String,
                  location: String,
                  pillLocation: PillType,
                  pillLevel: String) {
        let card = SkillAcquireCardView(name: name,
                                        type: type,
                                        location: location,
                                        pillLocation: pillLocation,
                                        pillLevel: pillLevel)
        card.heightAnchor.constraint(lessThanOrEqualToConstant: 100).isActive = true
        
        dungeonsStack.addArrangedSubview(card)
        card.render()
        dungeonsStack.layoutSubviews()
    }
    
    func createCards(with list: [MonsterModel]) {
        for monster in list {
            makeCard(name: monster.name,
                     type: monster.type.description(),
                     location: monster.location.name,
                     pillLocation:
                        PillType.fromLocationType(monster.location.type),
                     pillLevel: "Level \(monster.level.min)-\(monster.level.max)")
        }
    }
    
    // MARK: - Data flow methods
    
    func configure(for model: SkillModel) {
        title = model.title
        numberView.text = String(model.id)
        rankView.text = ConvertionHelper.numberToStars(model.rank)
        levelView.text = String(model.level)
        
        createCards(with: model.acquisition ?? [])
    }
    
}

#if DEBUG
struct SkillSheetControllerContainerView: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIViewController
    
    func makeUIViewController(context: Context) -> UIViewControllerType {
        let vc = SkillSheetController.instantiate()
        let navigationController = UINavigationController(rootViewController: vc)
        vc.configure(for:
            SkillModel(id: 2,
                       title: "Flame Thrower",
                       rank: 4,
                       level: 50,
                       acquisition: [
                        MonsterModel(id: 1,
                                     level: (min: 50, max: 70),
                                     name: "Gobmachine G-VI",
                                     type: .boss,
                                     location: LocationModel(id: 1,
                                                             name: "Brayflox's Longstop (Hard)",
                                                             level: 50,
                                                             type: .dungeon))
                       ]))
        return navigationController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}

struct SkillSheetController_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SkillSheetControllerContainerView()
                .previewLayout(.fixed(width: 375, height: 667))
                .colorScheme(.light)
            SkillSheetControllerContainerView()
                .previewLayout(.fixed(width: 375, height: 667))
                .colorScheme(.dark)
        }
    }
}
#endif

