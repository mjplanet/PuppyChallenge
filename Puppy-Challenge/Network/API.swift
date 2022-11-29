//
//  API.swift
//  Puppy-Challenge
//
//  Created by Mobin Jahantark on 11/28/22.
//

import Foundation
import Networking

protocol PriceAPIInterface {
    func getPrice(inputBody: InputModel, responseHandler handler: @escaping (Result<ResponseModel?, Error>) -> Void)
}

enum API {
    struct PriceAPI: PriceAPIInterface {
        func getPrice(inputBody: InputModel, responseHandler handler: @escaping (Result<ResponseModel?, Error>) -> Void) {
            let request = ServerRequest.Main.getPrice(inputBody: inputBody).urlRequest
            Networking.shared.request(request, model: ResponseModel.self, responseHandler: handler)
        }
    }
}
