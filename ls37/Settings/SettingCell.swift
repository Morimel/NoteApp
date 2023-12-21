//
//  SettingCell.swift
//  ls37
//
//  Created by Isa Melsov on 8/12/23.
//

import UIKit

protocol SettingCellDelegate: AnyObject {
    func didSwitchOn(isOn: Bool)
}

class SettingCell: UITableViewCell {
    
    static let reuseID = "settingCell"
    
    var delegate: SettingCellDelegate?
    
    var settingViewController = SettingViewController()
    
    private lazy var settingTitle: UILabel = {
        let view = UILabel()
        return view
    }()
    
    private lazy var settinSwitch: UISwitch = {
        let view = UISwitch()
        view.isHidden = true
        view.addTarget(self, action: #selector(switchOnOff), for: .valueChanged)
        view.isOn = UserDefaults.standard.bool(forKey: "theme")
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(title: String, type: SettingType) {
        settingTitle.text = title
        if type == .configure {
            settinSwitch.isHidden = false
        } else {
            settinSwitch.isHidden = true
        }
    }
    
    @objc private func switchOnOff() {
        delegate?.didSwitchOn(isOn: settinSwitch.isOn)
    }
    
    @objc private func setupConstraints() {
        contentView.addSubview(settingTitle)
        settingTitle.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(settinSwitch)
        settinSwitch.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            settingTitle.centerYAnchor.constraint(equalTo: centerYAnchor),
            settingTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            settinSwitch.centerYAnchor.constraint(equalTo: centerYAnchor),
            settinSwitch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
}
