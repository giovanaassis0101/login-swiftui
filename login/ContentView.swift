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
// 5. Botão de Login com efeito visual
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
                .buttonStyle(PressableButtonStyle())
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
    // 1. Variáveis de Estado para o Cadastro
    @State private var nome = ""
    @State private var sobrenome = ""
    @State private var email = ""
    @State private var confirmarEmail = ""
    @State private var senha = ""
    @State private var confirmarSenha = ""

    var body: some View {
        // 2. ScrollView: Permite rolar a tela se houver muitos campos
        ScrollView {
            VStack(spacing: 15) {
                Text("Crie sua conta")
                    .font(.title)
                    .bold()
                    .padding(.bottom, 10)

                // Campos de Nome e Sobrenome
                TextField("Nome", text: $nome)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)

                TextField("Sobrenome", text: $sobrenome)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)

                // Campos de E-mail
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

                // Campos de Senha
                SecureField("Senha", text: $senha)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)

                SecureField("Confirme sua Senha", text: $confirmarSenha)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)

                // Botão Cadastrar com Regra de Senha
                Button(action: {
                    print("Novo cadastro: \(nome) \(sobrenome) - \(email)")
                }) {
                    Text("Cadastrar")
                        .frame(maxWidth: .infinity)
                        .padding()
                        // Se as senhas não coincidirem, o botão fica cinza
                        .background(senhasCoincidem ? Color.green : Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .bold()
                }
                .disabled(!senhasCoincidem) // Desabilita o botão se as senhas forem diferentes
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

    // Regra Computada: Verifica se os campos de senha são iguais e não estão vazios
    private var senhasCoincidem: Bool {
        !senha.isEmpty && senha == confirmarSenha
    }
}

// 8. Efeito Visual de Toque (ButtonStyle)
struct PressableButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0) // Diminui 5% ao tocar
            .opacity(configuration.isPressed ? 0.8 : 1.0)     // Fica um pouco transparente
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}

#Preview {
    ContentView()
}
