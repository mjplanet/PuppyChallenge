//
//  ChooseAnimalModule.swift
//  Puppy-Challenge
//
//  Created by Mobin Jahantark on 11/28/22.
//

import SwiftUI

struct ChooseAnimalModule {
    func buildView() -> ChooseAnimalView {
        let viewModel = ChooseAnimalViewModel()
        let view = ChooseAnimalView(viewModel: viewModel)
        return view
    }
}
