//
//  SkillTableViewCell.swift
//  ProjectBlue
//
//  Created by Thiago Nitschke Simões on 01/04/22.
//

import UIKit

class SkillTableViewCell: UITableViewCell, ViewCodeConfiguration {
    
    // MARK: - Constants
    static let identifier = "skillCell"
    static let starCharacter = "★"
    
    // MARK: - Properties
    private lazy var card: UIView = {
        let element = UIView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.layer.cornerRadius = 10
        element.backgroundColor = .systemBackground
        return element
    }()
    
    private lazy var skillImage: UIImageView = {
        let element = UIImageView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.image = UIImage(named: "flameThrower")
        return element
    }()
    
    private lazy var horizontalStack: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.alignment = .center
        element.axis = .horizontal
        element.distribution = .fill
        element.spacing = 8
        return element
    }()
    
    private lazy var verticalStack: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.alignment = .fill
        element.axis = .vertical
        element.distribution = .fill
        element.spacing = 8
        element.isLayoutMarginsRelativeArrangement = true
        element.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 8,
                                                                   leading: 0,
                                                                   bottom: 8,
                                                                   trailing: 0)
        return element
    }()
    
    private lazy var titleStack: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.alignment = .fill
        element.axis = .horizontal
        element.distribution = .fill
        element.spacing = 8
        element.isBaselineRelativeArrangement = true
        element.isLayoutMarginsRelativeArrangement = true
        element.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0,
                                                                   leading: 8,
                                                                   bottom: 0,
                                                                   trailing: 8)
        return element
    }()
    
    private lazy var titleLabel: UILabel = {
        let element = UILabel()
        element.text = "Flame Thrower"
        element.font = .preferredFont(forTextStyle: .headline)
        element.setContentHuggingPriority(.defaultLow, for: .horizontal)
        element.setContentCompressionResistancePriority(.required, for: .horizontal)
        return element
    }()
    
    private lazy var numberView: IconTileView = {
        let element = IconTileView(iconName: "list.number",
                                   description: "Number: ",
                                   value: "2")
        return element
    }()
    
    private lazy var rankView: IconTileView = {
        let element = IconTileView(iconName: "star.circle",
                                   description: "Rank: ",
                                   value: ConvertionHelper.numberToStars(4))
        return element
    }()
    
    private lazy var bookmarkButton: UIButton = {
        let element = UIButton(type: .roundedRect)
        element.translatesAutoresizingMaskIntoConstraints = false
        element.layer.cornerRadius = 10
        let icon = UIImage(systemName: "bookmark.fill")
        element.setImage(icon, for: .normal)
        element.imageView?.contentMode = .scaleAspectFit
        element.imageEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        element.backgroundColor = .systemBlue.withAlphaComponent(0.15)
        element.tintColor = .systemBlue
        return element
    }()
    
    // MARK: - Constructors
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        render()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View lifecycle
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        contentView.backgroundColor = selected ?
            .systemBlue : .tertiarySystemGroupedBackground
    }
    
    // MARK: - Auxiliar methods
    func configure(for model: SkillModel) {
        titleLabel.text = model.title
        numberView.text = String(model.id)
        rankView.text = ConvertionHelper.numberToStars(model.rank)
    }
    
    // MARK: - View Code Functions
    func addHierarchy() {
        contentView.addSubview(card)
        card.addSubview(horizontalStack)
        
        horizontalStack.addArrangedSubview(skillImage)
        horizontalStack.addArrangedSubview(verticalStack)
        
        titleStack.addArrangedSubview(titleLabel)
        titleStack.addArrangedSubview(bookmarkButton)
  
        verticalStack.addArrangedSubview(titleStack)
        verticalStack.addArrangedSubview(numberView)
        verticalStack.addArrangedSubview(rankView)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            card.topAnchor.constraint(equalTo: contentView.topAnchor,
                                      constant: 8),
            card.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                          constant: 16),
            card.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                           constant: -16),
            card.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                         constant: -8),
            
            skillImage.widthAnchor.constraint(equalToConstant: 96),
            skillImage.heightAnchor.constraint(equalTo: skillImage.widthAnchor),
            
            horizontalStack.topAnchor.constraint(equalTo: card.topAnchor,
                                                 constant: 8),
            horizontalStack.bottomAnchor.constraint(equalTo: card.bottomAnchor,
                                                    constant: -8),
            horizontalStack.leadingAnchor.constraint(equalTo: card.leadingAnchor,
                                                     constant: 8),
            horizontalStack.trailingAnchor.constraint(equalTo: card.trailingAnchor,
                                                      constant: -8),
            
            bookmarkButton.heightAnchor.constraint(equalToConstant: 30),
            bookmarkButton.widthAnchor.constraint(equalTo:
                                                    bookmarkButton.heightAnchor)
        ])
    }
    
    func additionalProperties() {
        numberView.render()
        rankView.render()
    }
}
