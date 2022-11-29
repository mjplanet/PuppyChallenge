//
//  ChooseServicesViewModel.swift
//  Puppy-Challenge
//
//  Created by Mobin Jahantark on 11/28/22.
//

import Foundation
import SwiftUI

extension ChooseServicesView {
    @MainActor class ViewModel: ObservableObject {
        @Published var animalObject: Binding<AnimalModel>
        @Published var selectedAnimal: Animal
        
        init(animalObject: Binding<AnimalModel>, selectedAnimal: Animal) {
            self.animalObject = animalObject
            self.selectedAnimal = selectedAnimal
        }
    }
}
