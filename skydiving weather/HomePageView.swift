//
//  ContentView.swift
//  skydiving weather
//
//  Created by Léa Lescure on 22/12/2022.
//

import SwiftUI

struct HomePageView: View {
    var body: some View {
        ZStack{
            GeometryReader { geo in
                Image("skydiving-homepage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: geo.size.width)
                    .edgesIgnoringSafeArea(.all)
            }
            LocalisationView()
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
