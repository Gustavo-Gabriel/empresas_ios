//
//  ContentView.swift
//  empresas_ios
//
//  Created by Gustavo Anjos on 26/01/21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack{
            HeaderViewLogin()
            FormLoginView()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
