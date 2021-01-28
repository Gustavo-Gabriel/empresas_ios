//
//  DetailsView.swift
//  empresas_ios
//
//  Created by Gustavo Anjos on 27/01/21.
//

import SwiftUI

struct DetailsView: View {
    
    var enterpriseName: String
    var description: String
    
    var body: some View {
        
        VStack{
            ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false){
                EnterpriseView(enterpriseName: enterpriseName)
                
                Text(description)
                    .font(.custom("Rubik-Regular", size: 18))
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    .padding()
            }
            
            
            Spacer()
        }.navigationBarTitle(enterpriseName, displayMode: .inline)
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(enterpriseName: "", description: "")
    }
}
