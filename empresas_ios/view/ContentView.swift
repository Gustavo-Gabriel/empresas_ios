//
//  ContentView.swift
//  empresas_ios
//
//  Created by Gustavo Anjos on 26/01/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var email = ""
    @State var password = ""
    @State var hidde = false
    @State var showingDetail = false
    @State private var willMoveToNextScreen = false
    
    var body: some View {
        VStack{
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
            
            Group{
                HStack{
                    Text("Email")
                        .font(.custom("Rubik-Regular", size: 14))
                        .fontWeight(.regular)
                        .foregroundColor(Color(labelLoginColor))
                        .padding()
                    
                    Spacer()
                }
                
                TextField("", text: $email)
                    .frame(height: 48)
                    .background(Color(textFieldLoginColor))
                    .cornerRadius(4)
                    .padding(.horizontal)
                    .padding(.vertical, -10)
                
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
                            TextField("", text: $password)
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
                
                Button(action: {
                    showingDetail = true
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
            
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CurvedSideRectangle: Shape {
    
    var yOffset: CGFloat = 50
    
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        path.move(to: CGPoint.zero)
        path.addLine(to: CGPoint(x: rect.maxX, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - yOffset))
        path.addQuadCurve(to: CGPoint(x: 0, y: rect.maxY - yOffset),
                          control: CGPoint(x: rect.midX, y: rect.maxY + yOffset))
        
        path.closeSubpath()
        
        return path
        
    }
    
}

