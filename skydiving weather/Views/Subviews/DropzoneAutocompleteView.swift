//
//  SearchBarView.swift
//  skydiving weather
//
//  Created by Léa Lescure on 25/12/2022.
//

import SwiftUI

struct DropzoneAutocompleteView: View {
    
    @Binding var dropzoneSelected : String
    @Environment(\.dismiss) private var dismiss

    
    var body: some View {
        NavigationStack {
            List {
                ForEach(searchResults, id: \.self) { name in
                        Text(name)
                        .onTapGesture {
                            dropzoneSelected = name
                            dismiss()
                        }
                }
            }
        }
        .searchable(text: $dropzoneSelected, placement: .navigationBarDrawer(displayMode: .always))
    }

    var searchResults: [String] {
        if dropzoneSelected.isEmpty {
            return Dropzone.frenchDropzonesList.sorted()
        } else {
            return Dropzone.frenchDropzonesList.sorted().filter { $0.contains(dropzoneSelected) }
        }
    }
}

struct DropzoneAutocomplete_Previews: PreviewProvider {
    static var previews: some View {
        DropzoneAutocompleteView(dropzoneSelected: .constant(""))
    }
}
