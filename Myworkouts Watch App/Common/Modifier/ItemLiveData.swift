//
//  ItemLiveData.swift
//  Myworkouts Watch App
//
//  Created by MacBook on 14/06/2023.
//

import SwiftUI

struct ItemLiveData: View{
    var title: String? = nil
    var subTitle: String? = nil
    var body: some View {
        Button(action: {}) {
            VStack(alignment: .leading){
                Text(title ?? "Duration")
                    .font(.system(size: 12)).foregroundColor(Color(hex: 0xAAB0BB))
                Text(subTitle ?? "80:59").font(.system(size: 15)).fontWeight(.medium)
            }.frame(
                maxWidth: .infinity,
                alignment: .leading
            )
        }.buttonStyle(PlainButtonStyle()).buttonStyle(.borderedProminent).buttonBorderShape(.roundedRectangle).cornerRadius(8).padding().background(Color(hex: 0x252628))
    }
}


struct ItemLiveData_Previews: PreviewProvider {
    static var previews: some View {
        ItemLiveData()
    }
}

