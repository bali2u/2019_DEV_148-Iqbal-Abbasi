//
//  TicTacToePlayer.swift
//  XorTicTacToe
//
//  Created by Muhammad Iqbal on 31/03/2019.
//  Copyright © 2019 Xorlogics. All rights reserved.
//

import Foundation
import UIKit

enum TicTacToePlayer {
    case firstPlayer
    case secondPlayer
    
    func image() -> UIImage {
        switch self {
        case .firstPlayer:
            return #imageLiteral(resourceName: "Tick")
        case .secondPlayer:
            return #imageLiteral(resourceName: "Cross")
        }
    }
}
