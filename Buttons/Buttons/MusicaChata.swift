//
//  Music.swift
//  Buttons
//
//  Created by Raquel Ribeiro Hatem de Farias on 09/04/24.
//

// Para essa parte importe Foundation, SwiftUI e AVFoundation
import Foundation
import SwiftUI
import AVFoundation

// Para alternar as imagens da PageTwo entre um ouvido livre (que faz a música começar) e um ouvido coberto (que faz a música parar), nós criamos botões intercalaveis como mostrado abaixo.
struct MusicaChata: View {
    @State private var isImage1Visible = true
   
    
    var body: some View {
        // Crio meu botão e a função dele é criar um toggle (alteração) entre imagens, ele também chamará uma função que irá tocar e deslidar uma musiquinha.
         
        Button(action: {
            // Em baixo do botão você precisa definir o que esse botão fará (mudar de tela, tocar musica, voltar a tela anterior... O céu é o limite.).
            self.isImage1Visible.toggle()
            if self.isImage1Visible{
                playSound(sound: "Minha Música", type: "m4a", volume: 1.0, numberOfLoops: -1)
            } else{
                stopSound()
            }
        }) {
            // Altero entre as imagens baseado no clique do usuário:
            if isImage1Visible {
                // Se a condição incial for atendida, o som toca e a tela deve mostrar o desenho "speaker"
                Image(systemName: "speaker")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
                // O .foregroundStyle muda a cor do icone da minha imagem, se eu escolhece .background(Color .white) ele mudaria o fundo do meu botão mas não acor do icone em si.
                    .foregroundStyle(.white)

                // Se a condição incial não for atendida, o som para e a tela deve mostrar o desenho "speaker.slash"
            } else {
                Image(systemName: "speaker.slash")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150)
                    .foregroundStyle(.white)
                 
            }
               
        }
    }
}
// Para tocar uma música m4a no meu app, preciso declarar as variaveis e funcoes abaixo
var audioPlayer: AVAudioPlayer?
// O que a função abaixo está dizendo é que terei um som, qeu será chamado através de uma String, o tipo dele também será uma string (no nosso caso o tipo do arquivo, que foi gravado no Garage Band é m4a), o volume é um float significando que é um  número decimal e a "numberOfLoops" refere-se a qunatas vezes meu som deve ser repetido, a principio esse número é um inteiro igual a zero, mas ao chamar essa função na minha PageTwo eu deixarei esse valor igual a -1, para que a música fique on repeat eternamente, até que eu a deseje desligar com meu botão de desligar música.
func playSound(sound: String, type: String, volume: Float, numberOfLoops: Int = 0) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            // Aqui defino as funções do audioPlayer.
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.volume = volume
            audioPlayer?.numberOfLoops = numberOfLoops
            // o comando abaixo dá play na minha música:
            audioPlayer?.play()
        } catch {
            // Caso eu não consiga achar e tocar minha música o comando abaixo dever ser chamado.
            print("ERROR: Could not find and play the sound file!")
        }
    }
   
}
// Essa segunda função faz com que minha música pare, e ela está associada na minha Struct MusicaChata a imagem speakerSlash. Ou seja, quando a imagem speaker desaparecer e speakerSlash aparecer a música irá parar.
func stopSound(){
    audioPlayer?.stop()
}
