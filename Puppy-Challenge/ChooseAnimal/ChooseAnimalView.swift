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
    @State private var isSecondScreenPresented = false
    
    @ObservedObject var viewModel: ChooseAnimalViewModel

    init(viewModel: ChooseAnimalViewModel) {
        self.viewModel = viewModel
    }
    
    private func testNetwork() {
        let dog = AnimalModel(services: ServicesModel.init(grooming: true, hotel: HotelModel(nights: 5)))
        let cat = AnimalModel(services: ServicesModel.init(grooming: true, hotel: HotelModel(nights: 3)))
        let input = InputModel(dog: dog, cat: cat)
        
        API.Main().GetPrice(inputBody: input) { result in
            switch result {
            case .success(let success):
                print(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 100) {
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
                        //                isSecondScreenPresented = true
                        testNetwork()
                    } label: {
                        customImage(image: Image("Dog"), backgroundColor: secondColor)
                            .padding()
                    }
                    
                    Button {
                        isSecondScreenPresented = true
                    } label: {
                        customImage(image: Image("Cat"), backgroundColor: firstColor)
                            .padding()
                    }
                }
                
                Button {
                    
                } label: {
                    Text("Calculate price")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .padding(.vertical, 16)
                        .background(Color.blue)
                        .cornerRadius(16)
                }
                
            }
            .sheet(isPresented: $isSecondScreenPresented) {
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(colors: [firstColor, secondColor], startPoint: .bottomLeading, endPoint: .topTrailing))
    }
}

private struct customImage: View {
    var image: Image
    let backgroundColor: Color

    var body: some View {
        HStack {
            VStack {
                Text("Grooming ")
                    .font(.title2)
                    .foregroundColor(.white)
                Text("Hotel nights: 5")
                    .font(.title2)
                    .foregroundColor(.white)
            }
            .padding()
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .background(backgroundColor)
        .cornerRadius(16)
        .shadow(radius: 30)
    }
}

struct ChooseAnimalView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseAnimalModule().buildView()
    }
}
