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
    
    var body: some View {
        VStack {
            Text("Choose Animal")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundColor(.white.opacity(0.8))
            
            Button {
                isSecondScreenPresented = true
            } label: {
                customImage(image: Image("Dog"))
            }

            Button {
                isSecondScreenPresented = true
            } label: {
                customImage(image: Image("Cat"))
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(colors: [firstColor, secondColor], startPoint: .topTrailing, endPoint: .bottomLeading))
        .sheet(isPresented: $isSecondScreenPresented) {
        }
    }
}

private struct customImage: View {
    var image: Image
    var body: some View {
        image
            .resizable()
            .cornerRadius(16)
            .aspectRatio(contentMode: .fit)
            .frame(width: 300, height: 300)
            .shadow(radius: 30)
    }
}

struct ChooseAnimalView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseAnimalModule().buildView()
    }
}
