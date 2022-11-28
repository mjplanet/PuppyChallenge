//
//  ResponeModel.swift
//  Puppy-Challenge
//
//  Created by Mobin Jahantark on 11/28/22.
//

import Foundation

struct ResponseModel: Codable {
    var totalPrice: Int
    
    enum CodingKeys: String, CodingKey {
        case totalPrice = "total_price"
    }
}
