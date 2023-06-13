//
//  MatchLiveDataView.swift
//  Myworkouts Watch App
//
//  Created by MacBook on 14/06/2023.
//

import SwiftUI

struct MatchLiveDataView: View {
    @ObservedObject var viewModel = MatchViewModel()
    var body: some View {
        List{
            ForEach(viewModel.metrics, id: \.id){ item in
                ItemLiveData(title: item.title,subTitle: "\(item.value)",buttonAction:{})
            }
        }
    }
}

struct MatchLiveDataView_Previews: PreviewProvider {
    static var previews: some View {
        MatchLiveDataView()
    }
}

