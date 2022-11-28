//
//  ServerRequest.swift
//  Puppy-Challenge
//
//  Created by Mobin Jahantark on 11/28/22.
//

import Foundation

enum ServerRequest {
    enum Main {
        static func getPrice(inputBody: InputModel) -> HTTPRequest<ResponseModel> {
            let url: URLPath = .baseURL
            let httpRequest = HTTPRequest<ResponseModel>(url: url, method: .post, body: inputBody)
            return httpRequest
        }
    }
}
