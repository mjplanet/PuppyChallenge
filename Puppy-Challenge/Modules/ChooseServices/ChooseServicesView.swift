//
//  ChooseServicesView.swift
//  Puppy-Challenge
//
//  Created by Mobin Jahantark on 11/28/22.
//

import SwiftUI

struct ChooseServicesView: View {
    @ObservedObject private var viewModel: ViewModel
    @State private var isChooseNumberOfNightPresented = false
    @Environment(\.presentationMode) private var presentationMode

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            Text("Select Services")
                .foregroundColor(.white)
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            VStack(spacing: -20) {
                Text("Selected Pet")
                    .font(.title)
                    .foregroundColor(.white)
                
                viewModel.selectedAnimal.image
                    .resizable()
                    .cornerRadius(16)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
            }
            
            VStack(spacing: 0) {
                VisualPicker(title: "Grooming", isSelected: viewModel.animalObject.services.grooming)
                
                DaysHotelPicker(numberOfDays: viewModel.animalObject.services.hotel.nights) {
                    isChooseNumberOfNightPresented = true
                }
                
            }
            .padding(.vertical, 50)

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
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .background(viewModel.selectedAnimal.backgroundColor)
        .sheet(isPresented: $isChooseNumberOfNightPresented) {
            ChooseNumberOfNightsView(viewModel: ChooseNumberOfNightsView.ViewModel(animalObject: viewModel.animalObject, selectedAnimal: viewModel.selectedAnimal))
        }
    }
}

struct ChooseServicesView_Previews: PreviewProvider {
    static var previews: some View {
        let selectedAnimal = AnimalModel(services: ServicesModel(grooming: false, hotel: .init(nights: 0)))
        let viewModel = ChooseServicesView.ViewModel(animalObject: .constant(selectedAnimal), selectedAnimal: .cat)
        ChooseServicesView(viewModel: viewModel)
    }
}
