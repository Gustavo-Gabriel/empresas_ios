//
//  FormLoginView.swift
//  empresas_ios
//
//  Created by Gustavo Anjos on 27/01/21.
//

import SwiftUI

struct FormLoginView: View {
    
    @State var email = ""
    @State var password = ""
    @State var showingDetail = false
    @State var hidde = false
    @State var invalidCredentials = false
    
    
    var body: some View {
        
        let auth = AuthenticationService()
        var userDataLogin: [String: String] = [:]
        
        Group{
            HStack{
                Text("Email")
                    .font(.custom("Rubik-Regular", size: 14))
                    .fontWeight(.regular)
                    .foregroundColor(Color(labelLoginColor))
                    .padding()
                
                Spacer()
            }
            
            if !self.invalidCredentials{
                TextField("", text: $email)
                    .frame(height: 48)
                    .background(Color(textFieldLoginColor))
                    .cornerRadius(4)
                    .padding(.horizontal)
                    .padding(.vertical, -10)
            }else{
                TextField("", text: $email)
                    .frame(height: 48)
                    .background(Color(textFieldLoginColor))
                    .cornerRadius(4)
                    .padding(.horizontal)
                    .padding(.vertical, -10)
                    .overlay(
                        Rectangle()
                            .stroke(Color.red, lineWidth: 1)
                            .frame(height: 48)
                            .padding(.horizontal)
                        
                    )
            }
            
            
            
            HStack{
                Text("Senha")
                    .font(.custom("Rubik-Regular", size: 14))
                    .fontWeight(.regular)
                    .foregroundColor(Color(labelLoginColor))
                    .padding()
                
                Spacer()
            }
            
            ZStack{
                HStack{
                    if self.hidde{
                        
                        if !self.invalidCredentials{
                            TextField("", text: $password)
                                .frame(height: 48)
                                .background(Color(textFieldLoginColor))
                                .cornerRadius(4)
                                .padding(.horizontal)
                                .padding(.vertical, -10)
                        }else{
                            
                            TextField("", text: $password)
                                .frame(height: 48)
                                .background(Color(textFieldLoginColor))
                                .cornerRadius(4)
                                .padding(.horizontal)
                                .padding(.vertical, -10)
                                .overlay(
                                    Rectangle()
                                        .stroke(Color.red, lineWidth: 1)
                                        .frame(height: 48)
                                        .padding(.horizontal)
                                    
                                )
                            
                        }
                        
                        
                    }else{
                        if !self.invalidCredentials{
                            SecureField("", text: $password)
                                .frame(height: 48)
                                .background(Color(textFieldLoginColor))
                                .cornerRadius(4)
                                .padding(.horizontal)
                                .padding(.vertical, -10)
                        }else{
                            SecureField("", text: $password)
                                .frame(height: 48)
                                .background(Color(textFieldLoginColor))
                                .cornerRadius(4)
                                .padding(.horizontal)
                                .padding(.vertical, -10)
                                .overlay(
                                    Rectangle()
                                        .stroke(Color.red, lineWidth: 1)
                                        .frame(height: 48)
                                        .padding(.horizontal)
                                    
                                )
                        }
                        
                    }
                    
                }
                
                ZStack{
                    HStack{
                        Spacer()
                        
                        Button(action: {
                            self.hidde.toggle()
                        }) {
                            Image(systemName: self.hidde ? "eye.fill" : "eye.slash.fill")
                                .padding(.horizontal, 30)
                                .foregroundColor(Color(labelLoginColor))
                        }
                    }
                }
            }
            
            if invalidCredentials{
                HStack{
                    
                    Spacer()
                    
                    Text("Credenciais Incorretas")
                        .foregroundColor(Color(invalidCredentialsColor))
                        .font(.custom("Rubik-Regular", size: 12))
                        .padding(.horizontal)
                        .padding(.top, 10)
                }
            }
            
            Button(action: {
                
                
                
                auth.login(email: email, password: password) { (headerAccess) in
                    
                    
                    
                    DispatchQueue.main.async {
                        userDataLogin = headerAccess
                        
                        if userDataLogin == [:] {
                            self.invalidCredentials = true
                        }else{
                            self.showingDetail.toggle()
                        }
                        
                    }
                    
                    
                }
                
            }){
                
                Rectangle()
                    .frame(height: 48)
                    .foregroundColor(Color(buttonLoginColor))
                    .cornerRadius(8)
                    .overlay(
                        Text("ENTRAR")
                            .foregroundColor(.white)
                            .font(.custom("Rubik-Regular", size: 16))
                    ).padding()
                    .padding()
                
            }.fullScreenCover(isPresented: self.$showingDetail, content: {
                NewView()
            })
            
            
        }
    }
}

struct FormLoginView_Previews: PreviewProvider {
    static var previews: some View {
        FormLoginView()
    }
}

