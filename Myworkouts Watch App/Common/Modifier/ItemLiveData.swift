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
    var buttonAction: () -> Void = {}
    
    var body: some View {
        Button(action: { buttonAction() }) {
            VStack(alignment: .leading){
                Text(title ?? "")
                    .font(.system(size: 12)).foregroundColor(Color(hex: 0xAAB0BB))
                Text(subTitle ?? "").font(.system(size: 15)).fontWeight(.medium)
            }.frame(
                maxWidth: .infinity,
                alignment: .leading
            )
        }.buttonStyle(PlainButtonStyle()).cornerRadius(8).padding(.zero)
    }
}


struct ItemLiveData_Previews: PreviewProvider {
    static var previews: some View {
        ItemLiveData()
    }
}

