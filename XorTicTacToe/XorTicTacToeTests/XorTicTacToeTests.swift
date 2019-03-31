//
//  XorTicTacToeTests.swift
//  XorTicTacToeTests
//
//  Created by Muhammad Iqbal on 31/03/2019.
//  Copyright © 2019 Xorlogics. All rights reserved.
//

import XCTest
@testable import XorTicTacToe

class XorTicTacToeTests: XCTestCase {

    var game: TicTacToeGame?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        game = TicTacToeGame()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // Test first user winning
    // ✓ x ✓
    // x ✓ x
    // ✓
    // 0 5 2 1 6 3 4
    func testFirstUserWinning() {
        if let gameIns = game {
            
            var status = gameIns.makeMove(0)
            status = gameIns.makeMove(5)
            status = gameIns.makeMove(2)
            status = gameIns.makeMove(1)
            status = gameIns.makeMove(6)
            status = gameIns.makeMove(3)
            status = gameIns.makeMove(4)
            XCTAssertEqual(status, .gameFirstPlayerWon)
        }
    }
    
    // Test second user winning
    // ✓   ✓
    // x x x
    // x ✓ ✓
    // 7 4 8 6 2 3 0 5
    func testSecondUserWinning() {
        if let gameIns = game {
            
            var status = gameIns.makeMove(7)
            status = gameIns.makeMove(4)
            status = gameIns.makeMove(8)
            status = gameIns.makeMove(6)
            status = gameIns.makeMove(2)
            status = gameIns.makeMove(3)
            status = gameIns.makeMove(0)
            status = gameIns.makeMove(5)
            XCTAssertEqual(status, .gameSecondPlayerWon)
        }
    }
    
    // Test move not available
    //   ✓
    //   x
    // ✓
    // 1 1 4 4 6 6
    func testMoveNotAvailable() {
        if let gameIns = game {
            var status = gameIns.makeMove(1)
            status = gameIns.makeMove(1)
            XCTAssertEqual(status, .gameMoveNotAvailable)
            status = gameIns.makeMove(4)
            status = gameIns.makeMove(4)
            XCTAssertEqual(status, .gameMoveNotAvailable)
            status = gameIns.makeMove(6)
            status = gameIns.makeMove(6)
            XCTAssertEqual(status, .gameMoveNotAvailable)
        }
    }
    
    // Test in progress game
    // ✓ x ✓
    // x ✓ x
    //
    // 7 4 8 6 2 3 0 5
    func testInProgressGame() {
        if let gameIns = game {
            
            var status = gameIns.makeMove(0)
            XCTAssertEqual(status, .gameInProgress)
            status = gameIns.makeMove(1)
            XCTAssertEqual(status, .gameInProgress)
            status = gameIns.makeMove(2)
            XCTAssertEqual(status, .gameInProgress)
            status = gameIns.makeMove(3)
            XCTAssertEqual(status, .gameInProgress)
            status = gameIns.makeMove(4)
            XCTAssertEqual(status, .gameInProgress)
            status = gameIns.makeMove(5)
            XCTAssertEqual(status, .gameInProgress)
        }
    }
    
    // Test drawn game
    // ✓ x ✓
    // ✓ ✓ x
    // x ✓ x
    // 0 8 7 5 2 1 4 6 3
    func testDrawnGame() {
        if let gameIns = game {
            
            var status = gameIns.makeMove(0)
            status = gameIns.makeMove(8)
            status = gameIns.makeMove(7)
            status = gameIns.makeMove(5)
            status = gameIns.makeMove(2)
            status = gameIns.makeMove(1)
            status = gameIns.makeMove(4)
            status = gameIns.makeMove(6)
            status = gameIns.makeMove(3)
            XCTAssertEqual(status, .gameDrawn)
        }
    }
    
    // Test second user's turn
    // 0 3 2
    func testSecondUsersTurn() {
        if let gameIns = game {
            
            _ = gameIns.makeMove(0)
            _ = gameIns.makeMove(3)
            _ = gameIns.makeMove(2)
            XCTAssertEqual(gameIns.getCurrentPlyer(), .secondPlayer)
        }
    }
    
    // Test first user's turn
    // 5 8
    func testFirstUsersTurn() {
        if let gameIns = game {
            
            _ = gameIns.makeMove(5)
            _ = gameIns.makeMove(8)
            XCTAssertEqual(gameIns.getCurrentPlyer(), .firstPlayer)
        }
    }
    
    // Test starting user
    // At start, it should always be the First user starting the game for now
    func testStartingUser() {
        if let gameIns = game {
            XCTAssertEqual(gameIns.getCurrentPlayer(), .firstPlayer)
        }
    }
}
