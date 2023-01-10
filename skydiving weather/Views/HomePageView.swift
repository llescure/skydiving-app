//
//  ContentView.swift
//  skydiving weather
//
//  Created by Léa Lescure on 22/12/2022.
//

import SwiftUI

struct HomePageView: View {
    @StateObject var weatherVM: WeatherViewModel = WeatherViewModel()
    @State private var dropzoneSelected: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                GeometryReader { geo in
                    Image("skydiving-homepage")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: geo.size.width)
                }
                .edgesIgnoringSafeArea(.all)
                VStack {
                    LocalisationView(dropzoneSelected: $dropzoneSelected)
                    VStack {
                        Button(action : {
                            if (!dropzoneSelected.isEmpty) {
                                weatherVM.fetchData(for: dropzoneSelected)
                            }
                        }) {
                            Label("Can I skydive?", systemImage: "airplane.departure")
                                .bold()
                                .padding(10)
                                .labelStyle(.buttonIcon)
                            // Use of .infinity to have the button size automatically adjust depending on the screen size
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(Color("sky"))
                        .padding(.bottom, 60)
                        .padding(.horizontal, 40)
                    }
                }
                .navigationDestination(isPresented: $weatherVM.isFinishedLoading) {
                    WeatherResultView(dropzoneSelected: $dropzoneSelected, weather: weatherVM)
                }
            }
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
