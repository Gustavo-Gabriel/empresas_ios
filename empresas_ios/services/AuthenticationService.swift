//
//  AuthenticationService.swift
//  empresas_ios
//
//  Created by Gustavo Anjos on 27/01/21.
//

import Foundation

class AuthenticationService{
    
    var session: URLSession
    
    init() {
        self.session = URLSession.shared
    }
    
    func login(email: String, password: String, completation: @escaping([String: String]) -> Void){
        
        let userDict : [String: String] = ["email" : email, "password": password]
        
        var request = URLRequest(url: urlAuthentication)
        request.setValue("application/json", forHTTPHeaderField: "Content-type")
        request.httpMethod = "POST"
        
        guard let json = try? JSONEncoder().encode(userDict) else { return }
        
        let uploadTask = URLSession.shared.uploadTask(with: request, from: json){ (data, response, error) in
            
            if let _ = error {
                completation([:])
            }
            
            if let httpResponse = response as? HTTPURLResponse{
                
                if(200...299).contains(httpResponse.statusCode){
                    let tokenResponse = httpResponse.value(forHTTPHeaderField: "access-token")
                    let clientResponse = httpResponse.value(forHTTPHeaderField: "client")
                    let uidResponse = httpResponse.value(forHTTPHeaderField: "uid")
                    
                    print("token : \(tokenResponse!), client : \(clientResponse!), uid: \(uidResponse!)")
                    print(userDict)
                    
                    completation([
                        
                        "token" : String(tokenResponse!),
                        "client" : String(clientResponse!),
                        "uid" : String(uidResponse!)
                    ])
                    
                }else{
                    completation([:])
                    return
                }
                
            }
        }
        
        uploadTask.resume()
    }
    
    
}
