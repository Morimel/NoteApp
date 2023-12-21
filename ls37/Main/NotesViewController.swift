//
//  NotesViewController.swift
//  ls37
//
//  Created by Isa Melsov on 8/12/23.
//

import UIKit

class NotesViewController: UIViewController {
    
    private lazy var notesCollectionView: UICollectionView = {
        let layout = UICollectionViewLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.dataSource = self
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
        view.backgroundColor = .systemBackground
        let settingBarButton = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(settingsButtonTapped))
        navigationItem.rightBarButtonItem = settingBarButton
    }
    
    @objc private func settingsButtonTapped() {
        let settingsVC = SettingViewController()
        navigationController?.pushViewController(settingsVC, animated: true)
    }


}

extension NotesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
}
