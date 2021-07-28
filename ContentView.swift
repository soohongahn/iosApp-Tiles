//
//  ContentView.swift
//  Tiles
//
//  Created by soohong ahn on 2021/07/20.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        NavigationView{
            GeometryReader { geometry in
            ZStack {
                Image("background")
                    .resizable()
                    .aspectRatio(geometry.size, contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    Image("mainLogo")
                        .resizable()
                        .frame(width: 300, height: 300, alignment: .center)
                    Spacer()
                    NavigationLink(
                        destination: GameView(),
                        label:{
                        Image("playButton")
                            .frame(width: 200, height: 50, alignment: .center)
                    })

                    NavigationLink(
                        destination: AboutView(),
                        label:{
                        Image("aboutButton")
                            .frame(width: 200, height: 50, alignment: .center)
                    })
                    
                    Spacer()

                }
            }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
