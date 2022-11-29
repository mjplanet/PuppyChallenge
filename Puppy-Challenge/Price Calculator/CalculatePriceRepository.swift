//
//  CalculatePriceRepository.swift
//  Puppy-Challenge
//
//  Created by Mobin Jahantark on 11/29/22.
//

import Foundation

protocol CalculatePriceInterface: AnyObject {
    func calculateCostFromNetwork(inputBody: InputModel, responseHandler handler: @escaping (Result<ResponseModel?, Error>) -> Void)
    func calculateCostFromDatabase(isDogGroomingRequested: Bool, numberOfDogHotelNights: Int, isCatGroomingRequested: Bool, numberOfCatHotelNights: Int)
}

class CalculatePriceImp: CalculatePriceInterface {
    
    private var api: PriceAPIInterface
    
    init(api: PriceAPIInterface) {
        self.api = api
    }
    
    func calculateCostFromNetwork(inputBody: InputModel, responseHandler handler: @escaping (Result<ResponseModel?, Error>) -> Void) {
        api.getPrice(inputBody: inputBody, responseHandler: handler)

    }
    
    func calculateCostFromDatabase(isDogGroomingRequested: Bool, numberOfDogHotelNights: Int, isCatGroomingRequested: Bool, numberOfCatHotelNights: Int) {
        // Here we can add an implementation for calculating price from database
    }
}
