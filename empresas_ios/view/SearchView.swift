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
    @State var textSearch: String = ""
    
    var body: some View {
   
        NavigationView{
            VStack{
        
                BackgroundSearchView(height: 100)

                HStack {
                    TextField("Pesquise por empresa", text: $textSearch)
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
                .onAppear(perform: loadData)
                .padding(.horizontal, 16)
                .padding(.top, -30)
                
                if enterprises.filter({"\($0)".contains(textSearch) || textSearch.isEmpty}).count == 0{
                    
                    Spacer()
                    
                    Text("Nenhum Resultado Encontrado")
                        .font(.custom("Rubik-Regular", size: 18))
                        .foregroundColor(Color(labelLoginColor))
                    
                }else{
                    HStack{
                        Text("\(enterprises.filter({"\($0.enterprise_name)".contains(textSearch) || textSearch.isEmpty}).count) resultados encontrados")
                            .font(.custom("Rubik-Regular", size: 14))
                            .foregroundColor(Color(labelLoginColor))
                            .padding()
                        
                        Spacer()
                    }
                    
                    
                    List{
                        ForEach(enterprises.filter({"\($0.enterprise_name)".contains(textSearch) || textSearch.isEmpty}), id: \.self){ enterprise in
                            
                            NavigationLink(destination: DetailsView(enterpriseName: enterprise.enterprise_name, description: enterprise.description)) {
                                
                                EnterpriseView(enterpriseName: enterprise.enterprise_name)
                                    .padding(.horizontal)
                                
                            }.padding(.trailing, -24.0)
                            
                        }
                    }
                    
                    Spacer()
                    
                }
                
                Spacer()
            }
            .navigationBarHidden(true)
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
