//
//  Theme.swift
//  skydiving weather
//
//  Created by Léa Lescure on 23/12/2022.
//

import SwiftUI

enum Theme: String {
    case impossibleRed
    case okGreen
    case mediumOrange
    
    var accentColor: Color {
        return .white
    }
    var mainColor: Color {
        Color(rawValue)
    }
}
