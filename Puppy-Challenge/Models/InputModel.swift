//
//  InputModel.swift
//  Puppy-Challenge
//
//  Created by Mobin Jahantark on 11/28/22.
//

import Foundation

struct InputModel: Codable {
    let dog: AnimalModel
    let cat: AnimalModel
}

struct AnimalModel: Codable {
    var services: ServicesModel
}

struct ServicesModel: Codable {
    let grooming: Bool
    let hotel: HotelModel
}

struct HotelModel: Codable {
    var nights: Int
}
