//
//  ConfirmView.swift
//  Myworkouts Watch App
//
//  Created by MacBook on 14/06/2023.
//

import SwiftUI

struct ConfirmView: View{
    var title = ""
    var cancelButtonAction: () -> Void = {}
    var yesButtonAction: () -> Void = {}
    
    var body: some View {
        VStack{
            Text(title).multilineTextAlignment(.center).font(.system(size: 20))
            Spacer()
            HStack{
                Button(action: {cancelButtonAction()}, label: {
                    Text("Cancel").font(.subheadline).padding().frame(maxWidth: .infinity).foregroundColor(.white)
                }).buttonStyle(PlainButtonStyle()).background(Color(hex: 0x494A4C))
                Spacer()
                Button(action: {yesButtonAction()
                }, label: {
                    Text("Yes").font(.subheadline).padding().frame(maxWidth: .infinity).foregroundColor(.white)
                }).buttonStyle(PlainButtonStyle()).background(Color(hex: 0x09E099))
                
            }.mask(RoundedRectangle(cornerRadius: 25))
        }
    }
}

struct ConfirmView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmView()
    }
}
