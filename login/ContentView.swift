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
                        .background(Color(red: 1.0, green: 0.6, blue: 0.75))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .bold()
                }
                .buttonStyle(PressableButtonStyle())
                .padding(.top, 20)

                
                NavigationLink(destination: RegisterView()) {
                    Text("Não possui cadastro? ")
                        .foregroundColor(.primary) +
                    Text("Cadastre-se aqui.")
                        .foregroundColor(Color(red: 1.0, green: 0.5, blue: 0.7))
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
   
    @State private var nome = ""
    @State private var sobrenome = ""
    @State private var email = ""
    @State private var confirmarEmail = ""
    @State private var senha = ""
    @State private var confirmarSenha = ""

    var body: some View {
        
        ScrollView {
            VStack(spacing: 15) {
                Text("Crie sua conta")
                    .font(.title)
                    .bold()
                    .padding(.bottom, 10)

                
                TextField("Nome", text: $nome)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)

                TextField("Sobrenome", text: $sobrenome)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)

               
                TextField("E-mail", text: $email)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)

                TextField("Confirme seu E-mail", text: $confirmarEmail)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)

               
                SecureField("Senha", text: $senha)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)

                SecureField("Confirme sua Senha", text: $confirmarSenha)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)

               
                Button(action: {
                    print("Novo cadastro: \(nome) \(sobrenome) - \(email)")
                }) {
                    Text("Cadastrar")
                        .frame(maxWidth: .infinity)
                        .padding()
                       
                        .background(senhasCoincidem ? Color(red: 1.0, green: 0.6, blue: 0.75) : Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .bold()
                }
                .disabled(!senhasCoincidem)
                .buttonStyle(PressableButtonStyle())
                .padding(.top, 20)

                if !confirmarSenha.isEmpty && !senhasCoincidem {
                    Text("As senhas não coincidem")
                        .foregroundColor(.red)
                        .font(.caption)
                }
            }
            .padding(30)
        }
        .navigationTitle("Cadastro")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var senhasCoincidem: Bool {
        !senha.isEmpty && senha == confirmarSenha
    }
}

struct PressableButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .opacity(configuration.isPressed ? 0.8 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}

#Preview {
    ContentView()
}
