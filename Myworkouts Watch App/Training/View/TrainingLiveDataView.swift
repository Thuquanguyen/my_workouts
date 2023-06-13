//
//  TrainingLiveDataView.swift
//  Myworkouts Watch App
//
//  Created by MacBook on 12/06/2023.
//

import SwiftUI

struct TrainingLiveDataView: View {
    @ObservedObject var viewModel = TrainingViewModel()
    var body: some View {
        List{
            ForEach(viewModel.metrics, id: \.id){ item in
                ItemLiveData(title: item.title,subTitle: "\(item.value)",buttonAction:{})
            }
        }
    }
}

struct TrainingLiveDataView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingLiveDataView()
    }
}
