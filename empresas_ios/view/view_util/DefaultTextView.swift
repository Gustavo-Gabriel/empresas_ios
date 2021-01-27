//
//  DefaultTextView.swift
//  empresas_ios
//
//  Created by Gustavo Anjos on 27/01/21.
//

import SwiftUI

struct DefaultTextView: View {
    
    @State var text = ""
    
    var body: some View {
        
        TextField("", text: $text)
            .frame(height: 48)
            .background(Color(textFieldLoginColor))
            .cornerRadius(4)
            .padding(.horizontal)
            .padding(.vertical, -10)
        
    }
}

struct DefaultTextView_Previews: PreviewProvider {
    static var previews: some View {
        DefaultTextView()
    }
}
