//
//  Setting.swift
//  ls37
//
//  Created by Isa Melsov on 8/12/23.
//

import Foundation

enum SettingType {
    case none
    case configure
}

struct Setting {
    var title: String
    var type: SettingType
}
