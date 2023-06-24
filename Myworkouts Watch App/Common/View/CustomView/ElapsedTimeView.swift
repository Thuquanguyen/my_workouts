/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The elapsed time.
*/

import SwiftUI

struct ElapsedTimeView: View {
    var elapsedTime: TimeInterval = 0
    var showSubseconds: Bool = true
    @State private var timeFormatter = ElapsedTimeFormatter()

    var body: some View {
        Button(action: {}) {
            VStack(alignment: .leading){
                Text("Duration")
                    .font(.system(size: 12)).foregroundColor(Color(hex: 0xAAB0BB))
                Text(NSNumber(value: elapsedTime), formatter: timeFormatter)
                    .font(.system(size: 15)).fontWeight(.medium).foregroundColor(.white)
                    .onChange(of: showSubseconds) {
                        timeFormatter.showSubseconds = $0
                    }
            }.frame(
                maxWidth: .infinity,
                alignment: .leading
            )
        }.buttonStyle(PlainButtonStyle()).buttonStyle(.borderedProminent).buttonBorderShape(.roundedRectangle).cornerRadius(8).padding().background(Color(hex: 0x252628))
        
    }
}

class ElapsedTimeFormatter: Formatter {
    let componentsFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.zeroFormattingBehavior = .pad
        return formatter
    }()
    var showSubseconds = true

    override func string(for value: Any?) -> String? {
        guard let time = value as? TimeInterval else {
            return nil
        }

        guard let formattedString = componentsFormatter.string(from: time) else {
            return nil
        }

        if showSubseconds {
            let hundredths = Int((time.truncatingRemainder(dividingBy: 1)) * 100)
            let decimalSeparator = Locale.current.decimalSeparator ?? "."
            return String(format: "%@%@%0.2d", formattedString, decimalSeparator, hundredths)
        }

        return formattedString
    }
}

struct ElapsedTime_Previews: PreviewProvider {
    static var previews: some View {
        ElapsedTimeView()
    }
}
