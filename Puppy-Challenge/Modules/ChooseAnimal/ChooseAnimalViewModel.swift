//
//  ChooseAnimalViewModel.swift
//  Puppy-Challenge
//
//  Created by Mobin Jahantark on 11/28/22.
//

import Foundation
import SwiftUI

// If i had more time, I would add a condition with combine to check whether the calculate button should be disabled or not
extension ChooseAnimalView {
    @MainActor class ViewModel: ObservableObject {
        @Published var isLoading = false
        @Published var isResultValueHidden = true
        @Published var finalPrice: ResponseModel?
        @Published var animalObject: AnimalEnvironmentObject
        @Published var isErrorOccurred = false
        @Published var errorDescription = String()
        
        private var priceCalculator: CalculatePriceImp
       
        init(animalObject: AnimalEnvironmentObject, priceCalculator: CalculatePriceImp) {
            self.animalObject = animalObject
            self.priceCalculator = priceCalculator
        }
           
        func calculatePrice() {
            isLoading = true
            priceCalculator.calculateCostFromNetwork(inputBody: animalObject.animals) { [weak self] result in
                self?.isLoading = false
                switch result {
                case .success(let success):
                    self?.finalPrice = success
                    Task { @MainActor in
                        self?.isResultValueHidden = false
                    }
                    
                case .failure(let failure):
                    Task { @MainActor in
                        self?.isErrorOccurred = true
                        self?.errorDescription = failure.localizedDescription
                    }
                }
            }
        }
    }
}
