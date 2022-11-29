//
//  InputModel.swift
//  Puppy-Challenge
//
//  Created by Mobin Jahantark on 11/28/22.
//

import Foundation

struct InputModel: Codable {
    var dog: AnimalModel
    var cat: AnimalModel
}

struct AnimalModel: Codable {
    var services: ServicesModel
}

struct ServicesModel: Codable {
    var grooming: Bool
    var hotel: HotelModel
}

struct HotelModel: Codable {
    var nights: Int
}
