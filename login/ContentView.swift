//
//  ContentView.swift
//  login
//
//  Created by Giovana Assis on 28/04/26.
//

import SwiftUI

struct ContentView: View {
   
    @State private var email = ""
    @State private var senha = ""

    var body: some View {
        
        NavigationStack {
            VStack(spacing: 20) {
                Text("Bem-vindo!")
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 20)

                TextField("E-mail", text: $email)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)

                SecureField("Senha", text: $senha)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)

                Button(action: {
                    print("Tentativa de login com: \(email)")
                }) {
                    Text("Login")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .bold()
                }
                .padding(.top, 10)

                NavigationLink(destination: RegisterView()) {
                    Text("Não possui cadastro? ")
                        .foregroundColor(.primary) +
                    Text("Cadastre-se aqui.")
                        .foregroundColor(.blue)
                        .bold()
                }
                .font(.footnote)
                .padding(.top, 10)
            }
            .padding(30)
        }
    }
}

struct RegisterView: View {
    var body: some View {
        VStack {
            Text("Tela de Cadastro")
                .font(.title)
            Text("Aqui o usuário poderá criar uma nova conta.")
        }
        .navigationTitle("Cadastro")
    }
}

#Preview {
    ContentView()
}
