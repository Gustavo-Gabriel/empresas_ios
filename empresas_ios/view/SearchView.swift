//
//  SearchView.swift
//  empresas_ios
//
//  Created by Gustavo Anjos on 27/01/21.
//

import SwiftUI

struct SearchView: View {
    
    @State var enterprises = [Enterprise]()
    @Binding var text: String
    var user: User
    
    var body: some View {
        VStack{
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.top)
                .frame(height: 188)
            
            HStack {
                TextField("Pesquise por empresa", text: $text)
                    .frame(height: 48)
                    .cornerRadius(4)
                    .padding(.horizontal, 46)
                    .background(Color(.systemGray6))
                    .font(.custom("Rubik-Regular", size: 18))
                    
                    .overlay(
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 16)
                    )
            }
            .padding(.horizontal, 16)
            .padding(.top, -30)
            
            
            HStack{
                Text("\(enterprises.count) resultados encontrados")
                    .font(.custom("Rubik-Regular", size: 14))
                    .foregroundColor(Color(labelLoginColor))
                    .padding()
                
                Spacer()
            }
            
            List(enterprises, id:\.self) { enterprise in
                
                Rectangle()
                    .frame(height: 120)
                    .cornerRadius(4)
                    .foregroundColor(Color(enterpriseFirstColor))
                    .overlay(
                        Text(enterprise.enterprise_name)
                            .foregroundColor(.white)
                            .font(.custom("Rubik-Regular", size: 18))
                    )
            }.padding(.horizontal)
        }.onAppear(perform: loadData)
        
        Spacer()
        
    }
    
    func loadData(){
        
        let enterpriseService = EnterpriseService()
        
        enterpriseService.get(token: user.token, client: user.client, uid: user.uid) { (enterprises) in
            
            DispatchQueue.main.async {
                self.enterprises = enterprises
            }
        }
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(text: .constant(""), user: User(uid: "", token: "", client: ""))
    }
}
