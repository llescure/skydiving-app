//
//  ContentView.swift
//  skydiving weather
//
//  Created by Léa Lescure on 22/12/2022.
//

import SwiftUI

struct HomePageView: View {
    @State private var dropzoneSelected: String = ""
    @State private var isShowingWeatherForecast = false
    @State var isShowingDropzoneList : Bool = false
    
    var body: some View {
            NavigationStack {
                ZStack(alignment: .bottom) {
                    GeometryReader { geo in
                        Image("skydiving-homepage")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth: geo.size.width)
                            .edgesIgnoringSafeArea(.all)
                    }
                    VStack {
                        LocalisationView(dropzone: $dropzoneSelected, isShowingDropzoneList: $isShowingDropzoneList)
                        VStack {
                            Button(action : {
                                if (!dropzoneSelected.isEmpty) {
                                    self.isShowingWeatherForecast = true
                                }
                            }) {
                                Label("Ça saute ?", systemImage: "airplane.departure")
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
                    .navigationDestination(isPresented: $isShowingWeatherForecast) {
                        WeatherResultView(dropzone: $dropzoneSelected)
                    }
                }
            }
            .sheet(isPresented: $isShowingDropzoneList)
            {
                SearchBarView(searchText: $dropzoneSelected)
            }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
