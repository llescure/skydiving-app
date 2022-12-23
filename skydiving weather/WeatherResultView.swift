//
//  WeatherResultView.swift
//  skydiving weather
//
//  Created by Léa Lescure on 23/12/2022.
//

import SwiftUI

struct WeatherResultView: View {
    let dropzone: String
    
    var body: some View {
        NavigationView {
            Text("Dropzone : \(dropzone)")
                .navigationTitle(dropzone)
        }
    }
}

struct WeatherResultView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherResultView(dropzone: "")
    }
}
