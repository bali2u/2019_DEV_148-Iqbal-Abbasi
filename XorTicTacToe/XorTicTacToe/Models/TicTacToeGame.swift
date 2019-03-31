//
//  TicTacToeGame.swift
//  XorTicTacToe
//
//  Created by Muhammad Iqbal on 31/03/2019.
//  Copyright © 2019 Xorlogics. All rights reserved.
//

import Foundation

class TicTacToeGame {
    
    private var items = [TicTacToeItem]()
    private var gameStatus: TicTacToeGameStatus = .gameStarted
    private var currentPlayer: TicTacToePlayer = .firstPlayer
    private let winningPositions: Set<Set<Int>> = [
                                                    [0, 1, 2],
                                                    [3, 4, 5],
                                                    [6, 7, 8],
                                                    [0, 3, 6],
                                                    [1, 4, 7],
                                                    [2, 5, 8],
                                                    [0, 4, 8],
                                                    [2, 4, 6]
                                                  ]
    
    private var isFinished: Bool {
        if gameStatus == .gameDrawn || gameStatus == .gameFirstPlayerWon || gameStatus == .gameSecondPlayerWon {
            return true
        }
        return false
    }
    
    private func isMoveNotAvailable(_ index:Int) -> Bool {
        return items.contains { (t) -> Bool in
            return t.index == index
        }
    }
    
    private var isDrawn: Bool {
        return items.count == 9
    }
    
    private func checkWinner() -> Bool {
        let currPlayerMoves = Set(items.filter { (t) -> Bool in
            return t.player == currentPlayer
            }.map { (t) -> Int in
                return t.index
        })
        return winningPositions.first { $0.isSubset(of: currPlayerMoves) } != nil
    }
    
    public func getCurrentPlyer() -> TicTacToePlayer {
        return currentPlayer
    }
    
    public func getGameStatus() -> TicTacToeGameStatus {
        return gameStatus
    }
    
    public func getCurrentPlayer() -> TicTacToePlayer {
        return currentPlayer
    }
    
    public func restart() {
        items.removeAll()
        gameStatus = .gameStarted
        currentPlayer = .firstPlayer
    }
    
    func makeMove(_ index: Int) -> TicTacToeGameStatus{
        if isFinished {
            return gameStatus
        }
        
        if isMoveNotAvailable(index) {
            gameStatus = .gameMoveNotAvailable
            return gameStatus
        }
        
        items.append(TicTacToeItem(currentPlayer, index))
        
        if checkWinner() {
            gameStatus = currentPlayer == .firstPlayer ? .gameFirstPlayerWon : .gameSecondPlayerWon
            return gameStatus
        }
        
        // change the turn to other player now
        currentPlayer = currentPlayer == .firstPlayer ? .secondPlayer : .firstPlayer
        
        gameStatus = isDrawn ? .gameDrawn : .gameInProgress
        return gameStatus
    }
}
