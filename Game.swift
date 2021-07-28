//
//  game.swift
//  Tiles
//
//  Created by soohong ahn on 2021/07/22.
//

import Foundation

struct Game{
    var scoreCPU = 0;
    var scorePLYR = 0;
    var valueCPU = 0;
    var valuePLYR = 0;
    var usedCardsCPU: [Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    var usedCardPLYR: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    var EOG = false;
    var msgCPU = "0";
    var msgPLYR = "0";
    
    mutating func updateMSG(){
        if(EOG){
            if(scoreCPU > scorePLYR){
                msgCPU = "WIN"
                msgPLYR = "LOSE"
            } else if (scoreCPU < scorePLYR){
                msgCPU = "LOSE"
                msgPLYR = "WIN"
            } else{
                msgCPU = "DRAW"
                msgPLYR = "DRAW"
            }
        } else {
            msgCPU = String(scoreCPU)
            msgPLYR = String(scorePLYR)
        }
    }
    
    mutating func randomValueCPU(){
        repeat{
            if(usedCardsCPU.contains(0)){
                self.valueCPU = Int.random(in:1...10);
            } else{
                self.EOG = true;
                break
            }
        }while(checkUsed(card: valueCPU))
        self.usedCardsCPU[valueCPU - 1] = 1;
    }
    
    func checkUsed(card: Int) ->Bool{
            if(usedCardsCPU[card - 1] == 1){
                return true;
            } else{
                return false;
            }

    }
    
    func wbCheckCPU() -> String{
        if (self.valueCPU % 2 == 0){
            return "tileWhite"
        } else{
            return "tileBlack"
        }
    }
    
    mutating func compareCards(){
        if(valueCPU > valuePLYR){
            self.scoreCPU += 1;
        } else if(valueCPU < valuePLYR){
            self.scorePLYR += 1;
        }
    }
    
    mutating func reset(){
        scoreCPU = 0;
        scorePLYR = 0;
        valuePLYR = 0;
        usedCardsCPU = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        usedCardPLYR = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        self.EOG = false;
        msgCPU = "0";
        msgPLYR = "0";
        
        randomValueCPU()
    }
    
}
