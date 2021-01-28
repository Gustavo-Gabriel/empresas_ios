//
//  BackgroundSearchView.swift
//  empresas_ios
//
//  Created by Gustavo Anjos on 28/01/21.
//

import SwiftUI

struct BackgroundSearchView: View {
    
    var height: CGFloat
    
    var body: some View {
        Image("background")
            .resizable()
            .edgesIgnoringSafeArea(.top)
            .frame(height: height)
    }
}

struct BackgroundSearchView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundSearchView(height: 0)
    }
}
