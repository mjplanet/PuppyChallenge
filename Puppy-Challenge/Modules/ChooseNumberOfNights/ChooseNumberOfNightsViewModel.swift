//
//  ChooseNumberOfNightsViewModel.swift
//  Puppy-Challenge
//
//  Created by Mobin Jahantark on 11/28/22.
//

import SwiftUI

extension ChooseNumberOfNightsView {
    @MainActor class ViewModel: ObservableObject {
        var animalObject: Binding<AnimalModel>
        var selectedAnimal: Animal
        
        init(animalObject: Binding<AnimalModel>, selectedAnimal: Animal) {
            self.animalObject = animalObject
            self.selectedAnimal = selectedAnimal
        }
    }
}
