//
//  HeaderViewLogin.swift
//  empresas_ios
//
//  Created by Gustavo Anjos on 27/01/21.
//

import SwiftUI

struct HeaderViewLogin: View {
    var body: some View {
        ZStack{
            
            Image("background")
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(height: 257.5)
                .clipShape(CurvedSideRectangle(yOffset: 50))
            
            
            ZStack{
                
                VStack{
                    Image("logo_home")
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(width: 40, height: 31.58, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding()
                    
                    Text("Seja bem vindo ao empresas!")
                        .font(.custom("Rubik-Regular", size: 20))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                    
                }
                
            }
            
        }.edgesIgnoringSafeArea(.top)
    }
}

struct HeaderViewLogin_Previews: PreviewProvider {
    static var previews: some View {
        HeaderViewLogin()
    }
}
