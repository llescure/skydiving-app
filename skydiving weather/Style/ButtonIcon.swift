//
//  ButtonIcon.swift
//  skydiving weather
//
//  Created by Léa Lescure on 23/12/2022.
//

import SwiftUI

struct ButtonIconLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}

extension LabelStyle where Self == ButtonIconLabelStyle {
    static var buttonIcon: Self { Self() }
}
