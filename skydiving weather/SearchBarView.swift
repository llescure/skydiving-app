//
//  SearchBarView.swift
//  skydiving weather
//
//  Created by Léa Lescure on 25/12/2022.
//

import SwiftUI

import SwiftUI

struct SearchBarView: View {
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(searchResults, id: \.self) { name in
                    NavigationLink {
                        Text(name)
                    } label: {
                        Text(name)
                    }
                }
            }
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
    }

    var searchResults: [String] {
        if searchText.isEmpty {
            return Dropzone.frenchDropzonesList.sorted()
        } else {
            return Dropzone.frenchDropzonesList.sorted().filter { $0.contains(searchText) }
        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
    }
}
