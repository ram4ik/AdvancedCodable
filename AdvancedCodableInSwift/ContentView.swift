//
//  ContentView.swift
//  AdvancedCodableInSwift
//
//  Created by Ramill Ibragimov on 27.07.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var users = [User]()
    
    var body: some View {
        List(users, id: \.id) { user in
            VStack(alignment: .leading, spacing: 30) {
                Text("User name: \(user.username)")
                    .bold()
                VStack(alignment: .leading) {
                    Text("First name: \(user.firstName)")
                    Text("Last name: \(user.lastName)")
                }
                .foregroundColor(.secondary)
                
                Text("Birthday: \(user.dateOfBirth)")
                    .foregroundColor(.secondary)
                    .font(.caption)
                
                if let occupation = user.occupation {
                    Text("Occupation: \(occupation.name)")
                }
            }
            .padding(.vertical)
        }.onAppear() {
            parse()
        }
    }
    
    func parse() {
        
        if let path = Bundle.main.path(forResource: "Data", ofType: "json"),
           let data = FileManager.default.contents(atPath: path) {
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do {
                let data = try decoder.decode([User].self, from: data)
                dump(users)
                users = data
            } catch (let error) {
                print(error)
            }
            
            let encoder = JSONEncoder()
            encoder.keyEncodingStrategy = .convertToSnakeCase
            do {
                let data = try encoder.encode(users)
                dump(String(data: data, encoding: .utf8))
            } catch (let error) {
                print(error)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
