//
//  ContentView.swift
//  empresas_ios
//
//  Created by Gustavo Anjos on 26/01/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var isActive: Bool = false
    
    var body: some View {
        VStack{
            
            if self.isActive{
                HeaderViewLogin()
                FormLoginView()
                Spacer()
            }else{
                SplashScreenView()
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5){
                
                withAnimation{
                    self.isActive = true
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
