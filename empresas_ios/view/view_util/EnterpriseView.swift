//
//  EnterpriseView.swift
//  empresas_ios
//
//  Created by Gustavo Anjos on 27/01/21.
//

import SwiftUI

struct EnterpriseView: View {
    
    var enterpriseName: String
    
    var body: some View {
        Rectangle()
            .frame(height: 120)
            .cornerRadius(4)
            .foregroundColor(Color(enterpriseFirstColor))
            .overlay(
                Text(enterpriseName)
                    .foregroundColor(.white)
                    .font(.custom("Rubik-Regular", size: 18))
            )
    }
}

struct EnterpriseView_Previews: PreviewProvider {
    static var previews: some View {
        EnterpriseView(enterpriseName: "")
    }
}
