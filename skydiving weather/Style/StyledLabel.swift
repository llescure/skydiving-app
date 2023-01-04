//
//  StyledLabel.swift
//  skydiving weather
//
//  Created by Léa Lescure on 04/01/2023.
//

import SwiftUI

struct StyledLabel: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack (spacing: 10){
            configuration.icon
            configuration.title
        }
    }
}

extension LabelStyle where Self == StyledLabel {
    static var styledLabel: Self { Self() }
}
