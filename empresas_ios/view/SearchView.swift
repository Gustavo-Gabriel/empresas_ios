//
//  SearchView.swift
//  empresas_ios
//
//  Created by Gustavo Anjos on 27/01/21.
//

import SwiftUI

struct SearchView: View {

    var user: User
    @State var enterprises = [Enterprise]()
    @State var text: String = ""
    
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
                Text("\(enterprises.filter({"\($0)".contains(text) || text.isEmpty}).count) resultados encontrados")
                    .font(.custom("Rubik-Regular", size: 14))
                    .foregroundColor(Color(labelLoginColor))
                    .padding()
                
                Spacer()
            }
            
            
            List{
                ForEach(enterprises.filter({"\($0)".contains(text) || text.isEmpty}), id: \.self){ enterprise in
                    
                    Rectangle()
                        .frame(height: 120)
                        .cornerRadius(4)
                        .foregroundColor(Color(enterpriseFirstColor))
                        .overlay(
                            Text(enterprise.enterprise_name)
                                .foregroundColor(.white)
                                .font(.custom("Rubik-Regular", size: 18))
                        )
                        .padding(.horizontal)
                }
            }.onAppear(perform: loadData)
            
            Spacer()
            
        }

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
        SearchView(user: User(uid: "", token: "", client: ""))
    }
}
