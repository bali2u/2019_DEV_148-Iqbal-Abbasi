//
//  TicTacToeItem.swift
//  XorTicTacToe
//
//  Created by Muhammad Iqbal on 31/03/2019.
//  Copyright © 2019 Xorlogics. All rights reserved.
//

import Foundation

class TicTacToeItem {
    
    var player: TicTacToePlayer = .firstPlayer
    var index: Int = 0
    
    init(_ player:TicTacToePlayer, _ index:Int) {
        self.player = player
        self.index = index
    }
}
