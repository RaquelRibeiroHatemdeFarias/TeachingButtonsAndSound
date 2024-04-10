//
//  ContentView.swift
//  Buttons
//
//  Created by Raquel Ribeiro Hatem de Farias on 09/04/24.
//
// MARK: COMO FAZER BOTÕES?
/*
 Oi, gente! Tudo bem?
 Esse código é pra ajudar você a fazer seu próprio botão  usando SwuiftUI.
 */

import SwiftUI
// Antes de seguirmos, crie outro file do tipo "SwiftUI File" e o deixe salvo com o nome "PageTwo". A nossa ContentView será a nossa primeira view, ou a nossa primeira página e PageTwo, nossa segunda view.
struct ContentView: View {
    var body: some View {
        // Primeiramente, note que (caso você esteja usando o xcode e tenha aberto um file do tipo app) o file já abre com alguns códigos default, entre eles a pilha de vizualizações VStack.
        // VStack é uma estrutura de organização hierarquica que empilh as views uma sobre a outra e é usada para interfaces simples de uma view só.
        // Já a NavigationStack é uma estrutura utilizada para alternar entre views, mantendo um historico de vizualizações hierarquico.
        // Como um dos botões a ser criado é para alternar entre views, utilizaremos o NavigationStack.
        
        NavigationStack {
            // Eu uso o ZStack para criar uma visualizações que estarão sobrepostas umas as outras, o que estiver mais ao topo do meu código será ficará mais ao fundo da tela, enquanto o que vier por ultimo estará sobreposto.
            ZStack{
                // Podemos usar imagens proprias como imagem de fundo do nosso app. Para tal, use o figma para criar uma imagem que você curta para seu app.
                // Vá em Assets e importe a imagem que criou com o nome "MainBackground". Depois chame essa imagem, como mostrado abaixo.
                
                Image("MainBackground")
                    .resizable()
                    .scaledToFill()
                    .frame(alignment: .center)
                VStack{
                    
                    Spacer()
                    // Use uma outra imagem como botao. No meu caso usei o golfinho de direitos autorais do freePik. Você usou o "Spacer()" acima para que a imagem fosse para baixo e não ficasse centralizado.
                    // Crie um NavegationLink com o destino "PageTwo", para que quando você clique na imagem escolhida vá para a página seguinte.
                    NavigationLink(destination: PageTwo()) {
                        Image("button1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150)
                            .cornerRadius(20)
                            
                    }

                }
            }// O ignoresSafeArea() abaixo garate que seu plano de fundo ocupe toda a tela e não fique cortado nem peqeuno demais. Use ele ao ivés do padding. 
            .ignoresSafeArea()

        }
    }
}

#Preview {
    ContentView()
}
