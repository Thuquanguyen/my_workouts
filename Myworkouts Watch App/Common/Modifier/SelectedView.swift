//
//  SelectView.swift
//  Myworkouts Watch App
//
//  Created by MacBook on 14/06/2023.
//

import SwiftUI

struct SelectedView: View{
    var title = ""
    @State var selectedIndex = 0
    var body: some View{
        VStack {
            Spacer()
            Text(title)
                .font(.system(size: 10))
                .fontWeight(.medium)
                .foregroundColor(.black)
                .padding(.horizontal)
                .background(Color(hex: 0x818389))
                .cornerRadius(25)
            Picker("", selection: $selectedIndex) {
                ForEach(0..<100) { index in
                    Text("\(index)")
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(Color.white)
                }
            }.padding(.zero)
        }
    }
}


struct SelectedView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedView()
    }
}
