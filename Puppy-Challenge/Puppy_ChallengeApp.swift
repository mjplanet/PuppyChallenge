//
//  Puppy_ChallengeApp.swift
//  Puppy-Challenge
//
//  Created by Mobin Jahantark on 11/28/22.
//

import SwiftUI

@main
struct Puppy_ChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            let animalObject = AnimalEnvironmentObject()
            let api = API.PriceAPI()
            let priceCalculator = CalculatePriceImp(api: api)
            let viewModel = ChooseAnimalView.ViewModel(animalObject: animalObject, priceCalculator: priceCalculator)
            ChooseAnimalView(viewModel: viewModel)
        }
    }
}
