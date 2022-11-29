//
//  Animal.swift
//  Puppy-Challenge
//
//  Created by Mobin Jahantark on 11/28/22.
//

import SwiftUI

enum Animal: String {
    case dog = "Dog"
    case cat = "Cat"
    
    var backgroundColor: Color {
        switch self {
        case .dog:
            return Color(red: 217/255, green: 154/255, blue: 126/255)
        case .cat:
            return Color(red: 237/255, green: 144/255, blue: 137/255)
        }
    }
    
    var image: Image {
        switch self {
        case .dog:
            return Image("Dog")
        case .cat:
            return Image("Cat")
        }
    }
}

