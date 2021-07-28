//
//  about.swift
//  Tiles
//
//  Created by soohong ahn on 2021/07/22.
//

import SwiftUI

struct AboutView: View {
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                Image("background")
                    .resizable()
                    .aspectRatio(geometry.size, contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Spacer()
                    Image("aboutLogo")
                    Spacer()
                    Text("Tiles are numbered from 1 to 10.\nOdd tiles are blue and even tiles are white. Tile with 'higher' number wins.\nPredict the opponent’s tile and win as many rounds as possible. Have fun!")
                        .font(.body)
                        .fontWeight(.light)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 45.0)
                        .lineSpacing(20)
                    
                    Spacer()
                    Text("Made by Soohong Ahn")
                    Spacer()
                }
            }
        }
    }
}

struct about_preview: PreviewProvider {
    static var previews: some View {
        Group {
            AboutView()
        }
    }
}
