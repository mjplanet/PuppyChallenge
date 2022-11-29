//
//  DaysHotelPicker.swift
//  Puppy-Challenge
//
//  Created by Mobin Jahantark on 11/29/22.
//

import SwiftUI

struct DaysHotelPicker: View {
    @Binding var numberOfDays: Int
    var action: () -> ()
    var body: some View {
        HStack {
            Text("Choose number of staying days")
                .foregroundColor(.white)
            Spacer()
            Text(numberOfDays, format: .number)
                .foregroundColor(.white)
        }
        .padding()
        .background(Color.gray.opacity(0.3))
        .cornerRadius(16)
        .padding(.horizontal)
        .font(.title3)
        .onTapGesture {
            action()
        }
    }
}

struct DaysHotelPicker_Previews: PreviewProvider {
    static var previews: some View {
        DaysHotelPicker(numberOfDays: .constant(0)) {
        }
    }
}
