//
//  ViewController.swift
//  XorTicTacToe
//
//  Created by Muhammad Iqbal on 31/03/2019.
//  Copyright © 2019 Xorlogics. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    // Outlets
    @IBOutlet weak var ticTacToeCollView: UICollectionView!
    @IBOutlet weak var progressLabel: UILabel!
    
    // Game object
    var game: TicTacToeGame = TicTacToeGame()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tictactoecell", for: indexPath)
        cell.contentView.backgroundColor = UIColor.clear
        
        if let imgV = cell.contentView.viewWithTag(10001) {
            imgV.removeFromSuperview()
        }
        
        let imgView = UIImageView()
        imgView.tag = 10001
        imgView.image = nil
        imgView.frame = cell.contentView.frame
        cell.contentView.addSubview(imgView)
        cell.contentView.bringSubviewToFront(imgView)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // Set icon on the tapped cell
        let cell = collectionView.cellForItem(at: indexPath)
        var gameStatus = game.getGameStatus()
        if gameStatus != .gameDrawn && gameStatus != .gameFirstPlayerWon && gameStatus != .gameSecondPlayerWon {
            cell?.contentView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
            let imgView = cell?.contentView.viewWithTag(10001) as! UIImageView
            let gameCurrentPlayer = game.getCurrentPlyer()
            gameStatus = game.makeMove(indexPath.row)
            if gameStatus != .gameMoveNotAvailable {
                imgView.image = gameCurrentPlayer.image()
            }
        }
        
        // Set game status text
        switch gameStatus {
        case .gameStarted:
            break
        case .gameInProgress:
            if game.getCurrentPlayer() == .firstPlayer {
                progressLabel.text = "Player 1, your turn now"
            }
            else {
                progressLabel.text = "Player 2, your turn now"
            }
            break
        case .gameMoveNotAvailable:
            progressLabel.text = "Move not available, retry"
            break
        case .gameDrawn:
            progressLabel.text = "Game drawn - Restart to play again"
            break
        case .gameFirstPlayerWon:
            progressLabel.text = "Player 1 has won"
            break
        case .gameSecondPlayerWon:
            progressLabel.text = "Player 2 has won"
            break
        }
    }

    // Restart the game from begining
    @IBAction func restartGameTapped(_ sender: Any) {
        game.restart()
        ticTacToeCollView.reloadData()
        progressLabel.text = "Player 1 - Start Game"
    }
}

