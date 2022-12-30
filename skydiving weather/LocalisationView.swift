//
//  LocalisationView.swift
//  skydiving weather
//
//  Created by Léa Lescure on 23/12/2022.
//

import SwiftUI

struct LocalisationView: View {
    @Binding var dropzone: String
    @Binding var isShowingDropzoneList: Bool
    
    var body: some View{
        VStack(alignment: .leading, spacing: 0) {
            Text("Drop Zone")
                .font(.custom("header", size: 10))
                .foregroundColor(Color("lightGray"))
            TextField("", text: $dropzone)
                .styledTextfield()
        }
        .padding(.bottom, 20)
        .padding(.top, 5)
        .padding(.horizontal, 20)
        .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.white))
        .padding(.horizontal, 40)
        .onTapGesture {
            isShowingDropzoneList = true
        }
    }
}

struct LocalisationView_Previews: PreviewProvider {
    static var previews: some View {
        LocalisationView(dropzone: .constant(""), isShowingDropzoneList: .constant(false))
    }
}
