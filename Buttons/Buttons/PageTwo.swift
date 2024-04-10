//
//  PageTwo.swift
//  Buttons
//
//  Created by Raquel Ribeiro Hatem de Farias on 09/04/24.
//

import SwiftUI
// Agora ensinarei a fazer um botão em si e esse botão irá ligar e desligar uma musiquinha irritante.
struct PageTwo: View {
    var body: some View {
        ZStack{
            // Use o figma para criar a tela de fundo da sua segunda tela.
            Image("Background2")
                .resizable()
                .scaledToFill()
                .frame(alignment: .center)
            
            VStack{
                // Agora criaremos nosso botão que irá ser intercalavel com outra imagem e irá tocar e desligar mísica. Você pode usar um icone do prorpio xcode como seu botão, no caso eu escolhi o megafone.
                // Para criar seu botão, abra outro file chamado MusicaChata.
               // Importe sua Struct de MusicaChata como mostrado abaixo:
                MusicaChata()
            }

        }
        .ignoresSafeArea()
        // O ".onAppear" faz com que a minha música comece a tocar assim que a tela ContectView é trocada pela PageTwo, ou seja ele começa quando eu mudar minha view, e o ".onDisappear" faz com ele pare de ser tocado uma vez que eu saia da view PageTwo
        .onAppear {
            playSound(sound: "Minha Música", type: "m4a", volume: 1, numberOfLoops: -1)
        }
        .onDisappear(){
            stopSound()
        }
    }
}

#Preview {
    PageTwo()
}
