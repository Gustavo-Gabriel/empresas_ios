//
//  SplashScreenView.swift
//  empresas_ios
//
//  Created by Gustavo Anjos on 28/01/21.
//

import SwiftUI


struct SplashScreenView: View {
    
    @State var isActive: Bool = false
    
    var body: some View {
        
        Image("background")
            .resizable()
            .ignoresSafeArea(.all)
            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            .overlay(
            
                Image("logo_splash")
                    .frame(height: 45)
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            )
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
