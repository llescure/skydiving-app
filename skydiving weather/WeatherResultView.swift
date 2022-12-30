//
//  WeatherResultView.swift
//  skydiving weather
//
//  Created by Léa Lescure on 23/12/2022.
//

import SwiftUI

struct WeatherResultView: View {
    @Binding var dropzone: String
        
    var body: some View {
        VStack {
            NavigationStack {
                Text("Dropzone : \(dropzone)")
                    .navigationTitle(dropzone)
            }
        }
        // Used to reset the value o dropzone to empty
        .onDisappear{
            dropzone = ""
        }
    }
}

struct WeatherResultView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherResultView(dropzone: .constant(""))
    }
}
