//
//  API.swift
//  Puppy-Challenge
//
//  Created by Mobin Jahantark on 11/28/22.
//

import Foundation
import Networking

enum API {
    struct Main {
        func GetPrice(inputBody: InputModel, responseHandler handler: @escaping (Result<ResponseModel?, Error>) -> Void) {
            let request = ServerRequest.Main.getPrice(inputBody: inputBody).urlRequest
            Networking.shared.request(request, model: ResponseModel.self, responseHandler: handler)
        }
    }
}
