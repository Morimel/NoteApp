//
//  SettingViewController.swift
//  ls37
//
//  Created by Isa Melsov on 8/12/23.
//

import UIKit

class SettingViewController: UIViewController {
    
    var settings: [Setting] = [Setting(title: "Темная тема", type: .configure), Setting(title: "Выбрать язык", type: .none)]
    
    private lazy var settingsTableView: UITableView = {
        let view = UITableView()
        view.dataSource = self
        view.register(SettingCell.self, forCellReuseIdentifier: SettingCell.reuseID)
        return view
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let isDarkTheme = UserDefaults.standard.bool(forKey: "theme")
        
        if isDarkTheme == true {
            overrideUserInterfaceStyle = .dark
            navigationController?.overrideUserInterfaceStyle = .dark
        } else {
            overrideUserInterfaceStyle = .light
            navigationController?.overrideUserInterfaceStyle = .light
        }
        
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.backgroundColor = .systemBackground
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Настройки"
        setupConstraints()
    }
    
    private func setupConstraints() {
        view.addSubview(settingsTableView)
        settingsTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            settingsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            settingsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            settingsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            settingsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension SettingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingCell.reuseID, for: indexPath)
        as! SettingCell
        let settingItem = settings[indexPath.row]
        cell.setup(title: settingItem.title, type: settingItem.type)
        cell.delegate = self
        return cell
    }
}

extension SettingViewController: SettingCellDelegate {
    func didSwitchOn(isOn: Bool) {
        UserDefaults.standard.set(isOn, forKey: "theme")
        if isOn == true {
            navigationController?.overrideUserInterfaceStyle = .dark
            overrideUserInterfaceStyle = .dark
        } else {
            navigationController?.overrideUserInterfaceStyle = .light
            overrideUserInterfaceStyle = .light
        }
    }
}
