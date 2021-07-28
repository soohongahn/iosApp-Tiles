//
//  play.swift
//  Tiles
//
//  Created by soohong ahn on 2021/07/22.
//

import SwiftUI

struct GameView: View {
    
    @State private var game = Game();
    @State var cardCPU: String = "tile0";
    @State private var played = false;
    @State private var buttonImage = "select"
    
    var body: some View {
        GeometryReader { geometry in
        ZStack {
            Image("background")
                .resizable()
                .aspectRatio(geometry.size, contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .onAppear(perform: {
                    game.randomValueCPU()
                    cardCPU = game.wbCheckCPU()
                })
            VStack {
                Spacer()
                HStack{
                    Spacer()
                    VStack {
                        //Player Card
                        Image("tile" + String(game.valuePLYR))
                        HStack {
                            Image("player")
                            Text(game.msgPLYR)
                                .font(.body)
                                .fontWeight(.medium)
                                .foregroundColor(Color(red: 180 / 255, green: 48 / 255, blue: 48 / 255))
                        }
                    }
                    Spacer()
                    VStack {
                        //CPU Card
                        Image(cardCPU)
                        HStack {
                            Image("cpu")
                            Text(game.msgCPU)
                                .font(.body)
                                .fontWeight(.medium)
                                .foregroundColor(Color(red: 180 / 255, green: 48 / 255, blue: 48 / 255))
                        }
                    }
                    Spacer()
                }
                Spacer()
                HStack{
                    Button(action: {
                        game.valuePLYR = 1
                    }, label: {
                        Image("tile" + String(game.usedCardPLYR[0]))
                            .resizable()
                            .frame(width: 62, height: 80)
                    }).disabled((game.usedCardPLYR[0] == -1) || played)
                    Button(action: {
                        game.valuePLYR = 2
                    }, label: {
                        Image("tile" + String(game.usedCardPLYR[1]))
                            .resizable()
                            .frame(width: 62, height: 80)
                    }).disabled((game.usedCardPLYR[1] == -1) || played)
                    Button(action: {
                        game.valuePLYR = 3
                    }, label: {
                        Image("tile" + String(game.usedCardPLYR[2]))
                            .resizable()
                            .frame(width: 62, height: 80)
                    }).disabled((game.usedCardPLYR[2] == -1) || played)
                    Button(action: {
                        game.valuePLYR = 4
                    }, label: {
                        Image("tile" + String(game.usedCardPLYR[3]))
                            .resizable()
                            .frame(width: 62, height: 80)
                    }).disabled((game.usedCardPLYR[3] == -1) || played)
                    Button(action: {
                        game.valuePLYR = 5
                    }, label: {
                        Image("tile" + String(game.usedCardPLYR[4]))
                            .resizable()
                            .frame(width: 62, height: 80)
                    }).disabled((game.usedCardPLYR[4] == -1) || played)
                }
                HStack{
                    Button(action: {
                        game.valuePLYR = 6
                    }, label: {
                        Image("tile" + String(game.usedCardPLYR[5]))
                            .resizable()
                            .frame(width: 62, height: 80)
                    }).disabled((game.usedCardPLYR[5] == -1) || played)
                    Button(action: {
                        game.valuePLYR = 7
                    }, label: {
                        Image("tile" + String(game.usedCardPLYR[6]))
                            .resizable()
                            .frame(width: 62, height: 80)
                    }).disabled((game.usedCardPLYR[6] == -1) || played)
                    Button(action: {
                        game.valuePLYR = 8
                    }, label: {
                        Image("tile" + String(game.usedCardPLYR[7]))
                            .resizable()
                            .frame(width: 62, height: 80)
                    }).disabled((game.usedCardPLYR[7] == -1) || played)
                    Button(action: {
                        game.valuePLYR = 9
                    }, label: {
                        Image("tile" + String(game.usedCardPLYR[8]))
                            .resizable()
                            .frame(width: 62, height: 80)
                    }).disabled((game.usedCardPLYR[8] == -1) || played)
                    Button(action: {
                        game.valuePLYR = 10
                    }, label: {
                        Image("tile" + String(game.usedCardPLYR[9]))
                            .resizable()
                            .frame(width: 62, height: 80)
                    }).disabled((game.usedCardPLYR[9] == -1) || played)
                }
                Spacer()
                HStack{
                    //Select Button
                    Button(action: {
                        if(game.EOG){
                            game.reset()
                            buttonImage = "select"
                        }
                            if((game.valuePLYR > 0) && !played){
                                cardCPU = "tile" + String(game.valueCPU)
                                game.compareCards()
                                game.usedCardPLYR[game.valuePLYR - 1] = -1;
                                played = true;
                                buttonImage = "next"
                                game.updateMSG()
                            } else if(played){
                                game.randomValueCPU()
                                cardCPU = game.wbCheckCPU()
                                game.valuePLYR = 0
                                played = false;
                                
                                if(game.EOG){
                                    game.updateMSG()
                                    buttonImage = "playagain"
                                } else {
                                    buttonImage = "select"
                                }
                            }
                    }, label: {
                        Image(buttonImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                    })
                }
                Spacer()
            }
        }//VStack
    }
    }
}

struct play_preview: PreviewProvider {
    static var previews: some View {
        Group {
            GameView()
        }
    }
}
