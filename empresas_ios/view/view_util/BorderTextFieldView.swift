//
//  BorderTextFieldView.swift
//  empresas_ios
//
//  Created by Gustavo Anjos on 27/01/21.
//

import SwiftUI

struct BorderTextFieldView: View {
    var body: some View {
        Rectangle()
            .stroke(Color.red, lineWidth: 1)
            .frame(height: 48)
            .padding(.horizontal)
    }
}

struct BorderTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        BorderTextFieldView()
    }
}
