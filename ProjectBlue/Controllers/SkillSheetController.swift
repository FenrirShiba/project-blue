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
        return element
    }()
    
    private lazy var informationStack: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.alignment = .fill
        element.axis = .vertical
        element.distribution = .fill
        element.spacing = 16
        return element
    }()
    
    private lazy var acquireStack: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.alignment = .top
        element.axis = .horizontal
        element.distribution = .fill
        element.spacing = 4
        return element
    }()
    
    private lazy var pinStack: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.alignment = .center
        element.axis = .vertical
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
        element.setContentHuggingPriority(.defaultHigh, for: .horizontal)
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
    
    private lazy var dungeonView: IconTileView = {
        let element = IconTileView(iconName: "house.fill",
                                   value: "Dungeon or Raid",
                                   preferedFont: .headline)
        return element
    }()
    
    private lazy var dungeonItem: IconTileView = {
        let element = IconTileView(description: "Lvl. 50",
                                   value: "Gobmachine G-VI from Brayflox's Longstop (Hard)",
                                   preferedFont: .headline)
        return element
    }()
    
    private lazy var dungeonItem2: IconTileView = {
        let element = IconTileView(description: "Lvl. 50",
                                   value: "Einhander from The Keeper of the Lake",
                                   preferedFont: .headline)
        return element
    }()
    
    private lazy var dungeonItem3: IconTileView = {
        let element = IconTileView(description: "Lvl. 50",
                                   value: "Magitek Gunship from The Keeper of the Lake",
                                   preferedFont: .headline)
        return element
    }()
    
    private lazy var dungeonItem4: IconTileView = {
        let element = IconTileView(description: "Lvl. 70",
                                   value: "Omega from Alphascape V3.0",
                                   preferedFont: .body)
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
        informationStack.addArrangedSubview(dungeonView)
        headerStack.addArrangedSubview(skillImageView)
        
        acquireStack.addArrangedSubview(pinStack)
        pinStack.addArrangedSubview(pinView)
        pinStack.addArrangedSubview(lineView)
        acquireStack.addArrangedSubview(dungeonsStack)
        dungeonsStack.addArrangedSubview(dungeonItem)
        dungeonsStack.addArrangedSubview(dungeonItem2)
        dungeonsStack.addArrangedSubview(dungeonItem3)
        dungeonsStack.addArrangedSubview(dungeonItem4)
        verticalStack.addArrangedSubview(bookmarkButton)
        
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            verticalStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            verticalStack.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            verticalStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            verticalStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            
            pinView.heightAnchor.constraint(equalToConstant: 22),
            pinView.widthAnchor.constraint(equalTo: pinView.heightAnchor),
            
            lineView.widthAnchor.constraint(equalToConstant: 4),
            lineView.heightAnchor.constraint(equalTo:
                                                dungeonsStack.heightAnchor, constant: -42),
            
            bookmarkButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    func additionalProperties() {
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
        
        numberView.render()
        rankView.render()
        levelView.render()
        dungeonView.render()
        dungeonItem.render()
        dungeonItem2.render()
        dungeonItem3.render()
        dungeonItem4.render()
    }
    
    // MARK: - Data flow methods
    
    func configure(for model: SkillModel) {
        title = model.title
        numberView.text = String(model.id)
        rankView.text = ConvertionHelper.numberToStars(model.rank)
        levelView.text = String(model.level)
        
        dungeonItem2.isHidden = true
        dungeonItem3.isHidden = true
        dungeonItem4.isHidden = true
        if let acquisitionMethods = model.acquisition {
            acquisitionMethods.indices.forEach { index in
                switch index {
                case 0:
                    dungeonItem.text = acquisitionMethods[index].location.name
                    dungeonItem.descriptionText = acquisitionMethods[index].name
                case 1:
                    dungeonItem2.text = acquisitionMethods[index].location.name
                    dungeonItem2.descriptionText = acquisitionMethods[index].name
                    dungeonItem2.isHidden = false
                case 2:
                    dungeonItem3.text = acquisitionMethods[index].location.name
                    dungeonItem3.descriptionText = acquisitionMethods[index].name
                    dungeonItem3.isHidden = false
                case 3:
                    dungeonItem4.text = acquisitionMethods[index].location.name
                    dungeonItem4.descriptionText = acquisitionMethods[index].name
                    dungeonItem4.isHidden = false
                default:
                    break
                }
            }
        }
    }
    
}

#if DEBUG
struct SkillSheetControllerContainerView: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIViewController
    
    func makeUIViewController(context: Context) -> UIViewControllerType {
        let navigationController = UINavigationController(rootViewController: SkillSheetController.instantiate())
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

