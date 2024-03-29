//
//  ViewController.swift
//  ProjectBlue
//
//  Created by Thiago Nitschke Simões on 28/03/22.
//

#if DEBUG
import SwiftUI
#endif

import UIKit

class MainViewController: UIViewController {
    
    var skills: [SkillModel] = [
        SkillModel(id: 1,
                   title: "Water Cannon",
                   rank: 1,
                   level: 1),
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
                                                         type: .dungeon)),
                    MonsterModel(id: 2,
                                 level: (min: 50, max: 70),
                                 name: "Einhander",
                                 type: .boss,
                                 location: LocationModel(id: 1,
                                                         name: "The Keeper of the Lake",
                                                         level: 50,
                                                         type: .dungeon)),
                    MonsterModel(id: 3,
                                 level: (min: 50, max: 70),
                                 name: "Magitek Gunship",
                                 type: .fate(position: (x: 1.6, y: 7.4)),
                                 location: LocationModel(id: 1,
                                                         name: "The Keeper of the Lake",
                                                         level: 50,
                                                         type: .dungeon)),
                    MonsterModel(id: 4,
                                 level: (min: 50, max: 70),
                                 name: "Omega",
                                 type: .rank(level: .A),
                                 location: LocationModel(id: 1,
                                                         name: "Alphascape V3.0",
                                                         level: 70,
                                                         type: .raid))
                   ]),
        SkillModel(id: 3,
                   title: "Aqua Breath",
                   rank: 4,
                   level: 50,
                   acquisition: [
                    MonsterModel(id: 5,
                                 level: (min: 50, max: 70),
                                 name: "Ultros",
                                 type: .boss,
                                 location: LocationModel(id: 1,
                                                         name: "The Dragon's Neck",
                                                         level: 50,
                                                         type: .trial)),
                    MonsterModel(id: 6,
                                 level: (min: 50, max: 50),
                                 name: "Leviathan",
                                 type: .boss,
                                 location: LocationModel(id: 1,
                                                         name: """
                                                         The Whorleater (Hard),
                                                         The Whorleater (Extreme)
                                                         """,
                                                         level: 50,
                                                         type: .openWorld)),
                    MonsterModel(id: 7,
                                 level: (min: 50, max: 70),
                                 name: "Ultros",
                                 type: .boss,
                                 location: LocationModel(id: 1,
                                                         name: "Stage 20 Masked Carnivale - Miss Typhon",
                                                         level: 50,
                                                         type: .maskedCarnivale))
                   ]),
        SkillModel(id: 4,
                   title: "Flying Frenzy",
                   rank: 3,
                   level: 50),
        SkillModel(id: 5,
                   title: "Drill Cannons",
                   rank: 2,
                   level: 50),
        SkillModel(id: 6,
                   title: "High Voltage",
                   rank: 4,
                   level: 50),
        SkillModel(id: 7,
                   title: "Loom",
                   rank: 1,
                   level: 50)
    ]
    
    private let tableView: UITableView = {
        let element = UITableView()
        element.register(SkillTableViewCell.self,
                         forCellReuseIdentifier: SkillTableViewCell.identifier)
        element.separatorStyle = .none
        return element
    }()
    
    static func instantiate() -> MainViewController {
        let viewController = MainViewController()
        
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableView.automaticDimension
        
        view.addSubview(tableView)
        
        title = "Blue Mage Skills"
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
    }
    
    func openSheet(for skill: SkillModel) {
        let sheetViewController = SkillSheetController.instantiate()
        sheetViewController.configure(for: skill)
        
        let navigationController = UINavigationController(rootViewController: sheetViewController)
        
        present(navigationController, animated: true, completion: nil)
    }
}

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let cell = tableView.cellForRow(at: indexPath) as? SkillTableViewCell else {
            return
        }
        let skill = skills[indexPath.row]
        
        //        skill.isBookmarked = !skill.isBookmarked
        
        //        tableView.beginUpdates()
        //        skills.remove(at: indexPath.row)
        //        skills.insert(skill, at: indexPath.row)
        //
        //        cell.toggleCard(skill.isExpanded)
        //        tableView.endUpdates()
        
        //        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
        
        openSheet(for: skill)
    }
}


extension MainViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return skills.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: SkillTableViewCell.identifier,
            for: indexPath
        ) as? SkillTableViewCell
        else {
            return UITableViewCell()
        }
        cell.configure(for: skills[indexPath.row])
        
        return cell
    }
    
}

#if DEBUG
struct MainViewControllerContainerView: UIViewControllerRepresentable {
    typealias UIViewControllerType = MainViewController
    
    func makeUIViewController(context: Context) -> UIViewControllerType {
        return MainViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}

struct MainViewController_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainViewControllerContainerView()
                .previewLayout(.fixed(width: 375, height: 667))
                .colorScheme(.light)
            MainViewControllerContainerView()
                .previewLayout(.fixed(width: 375, height: 667))
                .colorScheme(.dark)
        }
    }
}
#endif
