//
//  VisualPicker.swift
//  Puppy-Challenge
//
//  Created by Mobin Jahantark on 11/29/22.
//

import SwiftUI

struct VisualPicker: View {
    var title: String
    @Binding var isSelected: Bool
    
    var body: some View {
        Group {
            HStack(alignment: .center) {
                isSelected ? Image(systemName: "checkmark.square") : Image(systemName: "square")
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.title2)
                        .foregroundColor(.black.opacity(0.6))
                }
                Spacer()
            }
            .padding()
            .background(isSelected ? Color.gray : Color.gray.opacity(0.3))
            .blendMode(.colorBurn)
            .cornerRadius(16)
            .padding()
        }
        .contentShape(Rectangle())
        .onTapGesture {
            isSelected.toggle()
        }
    }
}

struct VisualPicker_Previews: PreviewProvider {
    static var previews: some View {
        VisualPicker(title: "Test", isSelected: .constant(false))
    }
}
