//
//  StyledTextfield.swift
//  skydiving weather
//
//  Created by Léa Lescure on 23/12/2022.
//

import Foundation
import SwiftUI

extension View {
    func styledTextfield() -> some View {
        self
            .overlay(Rectangle().frame(height: 2).padding(.top, 35))
            .foregroundColor(Color("lightGray"))
            .disableAutocorrection(true)
    }
}
