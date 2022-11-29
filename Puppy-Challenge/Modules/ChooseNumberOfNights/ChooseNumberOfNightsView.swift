//
//  ChooseNumberOfNightsView.swift
//  Puppy-Challenge
//
//  Created by Mobin Jahantark on 11/28/22.
//

import SwiftUI

struct ChooseNumberOfNightsView: View {
    @ObservedObject private var viewModel: ViewModel
    
    @Environment(\.presentationMode) private var presentationMode
    
    let backgroundColorArray: [Color] = [Color(red: 147 / 255, green: 156 / 255, blue: 212 / 255),
                                         Color(red: 91 / 255, green: 125 / 255, blue: 211 / 255)]

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            Spacer()
            Image("Hotel")
                .resizable()
                .frame(width: 300, height: 300)
                .cornerRadius(16)
            Spacer()
            Text(viewModel.animalObject.services.hotel.nights.wrappedValue, format: .number)
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.white)
            Spacer()
            Stepper(value: viewModel.animalObject.services.hotel.nights, in: 0...30) {
                Text("Number of nights")
                    .foregroundColor(.black.opacity(0.8))
                    .font(.title2)
            }
            .padding()
            .background(.thinMaterial)
            .cornerRadius(16)
            Spacer()
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Confirm")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .padding(.horizontal)
                    .frame(width: 300)
                    .background(.blue)
                    .cornerRadius(16)
            }
            Spacer()
            Spacer()
        }
        .padding()
        .background(LinearGradient(colors: backgroundColorArray, startPoint: .bottomLeading, endPoint: .topTrailing))
    }
}

struct ChooseNumberOfNightsView_Previews: PreviewProvider {
    static var previews: some View {
        let selectedAnimal = AnimalModel(services: .init(grooming: false, hotel: HotelModel.init(nights: 0)))
        ChooseNumberOfNightsView(viewModel: ChooseNumberOfNightsView.ViewModel(animalObject: .constant(selectedAnimal), selectedAnimal: .cat))
    }
}
