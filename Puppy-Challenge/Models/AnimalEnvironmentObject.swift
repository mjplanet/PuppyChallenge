//
//  AnimalEnvironmentObject.swift
//  Puppy-Challenge
//
//  Created by Mobin Jahantark on 11/29/22.
//

import SwiftUI

class AnimalEnvironmentObject: ObservableObject {
    @Published var animals: InputModel
    @Published var selectedAnimal: Animal
    
    init() {
        let dog = AnimalModel(services: .init(grooming: false, hotel: .init(nights: 0)))
        let cat = AnimalModel(services: .init(grooming: false, hotel: .init(nights: 0)))
        selectedAnimal = .dog
        animals = .init(dog: dog, cat: cat)
    }
}
