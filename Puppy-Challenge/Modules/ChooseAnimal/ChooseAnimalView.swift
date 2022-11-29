//
//  ChooseAnimalView.swift
//  Puppy-Challenge
//
//  Created by Mobin Jahantark on 11/28/22.
//

import SwiftUI

struct ChooseAnimalView: View {
    let firstColor = Color(red: 237/255, green: 144/255, blue: 137/255)
    let secondColor = Color(red: 217/255, green: 154/255, blue: 126/255)
    
    @ObservedObject private var viewModel: ViewModel
    @State private var isDogServicesViewPresented = false
    @State private var isCatServicesViewPresented = false

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    @ViewBuilder var calculatePriceButtonLabel: any View {
        Text("Calculate price")
            .font(.title)
            .foregroundColor(.white)
            .frame(width: 200, height: 55)
            .background(Color.blue)
            .cornerRadius(16)
    }
    
    @ViewBuilder var buttonLoader: any View {
        ProgressView()
            .tint(.white)
            .frame(width: 200, height: 55)
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(16)
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                VStack {
                    Text("Choose Your Pet")
                        .font(.largeTitle)
                        .fontWeight(.black)
                    Text("You can choose grooming and hotel services for each of your pets!")
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)

                }
                .foregroundColor(.white.opacity(0.8))
                    
                VStack(spacing: 0) {
                    Button {
                        isDogServicesViewPresented = true
                    } label: {
                        customImage(image: Image("Dog"), backgroundColor: secondColor, grooming: viewModel.animalObject.animals.dog.services.grooming, numberOfNights: viewModel.animalObject.animals.dog.services.hotel.nights)
                            .padding()
                    }
                    
                    Button {
                        isCatServicesViewPresented = true
                    } label: {
                        customImage(image: Image("Cat"), backgroundColor: firstColor, grooming: viewModel.animalObject.animals.cat.services.grooming, numberOfNights: viewModel.animalObject.animals.cat.services.hotel.nights)
                            .padding()
                    }
                }

                Group {
                    viewModel.isLoading ? AnyView(buttonLoader) : AnyView(calculatePriceButtonLabel)
                }
                .onTapGesture {
                    viewModel.calculatePrice()
                }
                
                
                if !viewModel.isResultValueHidden {
                    Text("Final price: \(viewModel.finalPrice?.totalPrice ?? 0)")
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                }

                
            }
            .sheet(isPresented: $isCatServicesViewPresented) {
                ChooseServicesView(viewModel: ChooseServicesView.ViewModel(animalObject: $viewModel.animalObject.animals.cat, selectedAnimal: .cat))
            }
            .sheet(isPresented: $isDogServicesViewPresented) {
                ChooseServicesView(viewModel: ChooseServicesView.ViewModel(animalObject: $viewModel.animalObject.animals.dog, selectedAnimal: .dog))
            }
            .alert("Error", isPresented: $viewModel.isErrorOccurred) {} message: {
                Text(viewModel.errorDescription)
            }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(colors: [firstColor, secondColor], startPoint: .bottomLeading, endPoint: .topTrailing))
    }
}

private struct customImage: View {
    var image: Image
    let backgroundColor: Color
    var grooming: Bool
    var numberOfNights: Int
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                if grooming {
                    Text("Grooming")
                        .font(.title3)
                        .foregroundColor(.white)
                }
                if numberOfNights > 0 {
                    Text("Days: \(numberOfNights)")
                        .font(.title3)
                        .foregroundColor(.white)
                }
            }
            .padding()
            Spacer()
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .frame(maxHeight: 150)
        .background(backgroundColor)
        .cornerRadius(16)
        .shadow(radius: 30)
    }
}

struct ChooseAnimalView_Previews: PreviewProvider {
    static var previews: some View {
        let animalObject = AnimalEnvironmentObject()
        let api = API.PriceAPI()
        let priceCalculator = CalculatePriceImp(api: api)
        let viewModel = ChooseAnimalView.ViewModel(animalObject: animalObject, priceCalculator: priceCalculator)
        ChooseAnimalView(viewModel: viewModel)
    }
}
