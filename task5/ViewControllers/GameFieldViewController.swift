
import UIKit

class GameFieldViewController: UIViewController {
    @IBOutlet var viewArray: [UIView]!
    
    @IBOutlet var buttonArray: [UIButton]!
    
    var playerMoves:[Int] = []
    var computerMoves:[Int] = []
    var wins = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]

    
    override func viewDidLoad() {
        super.viewDidLoad()

        addBorder()
    }
    
    @IBAction func buttonIsPressed(_ sender: UIButton) {
        
        if sender.isUserInteractionEnabled {
            sender.setTitle("X", for: .normal)
            sender.isUserInteractionEnabled = false
            playerMoves.append(sender.tag)
        }
        
        var index = 0
        for element in buttonArray {
            if sender == element {
                buttonArray.remove(at: index)
            }
            index += 1
        }
        isWin(moves: playerMoves, name: "HUMAN")
        computerMove()

    }

    func computerMove() {
        if buttonArray.count > 0 {
            let range = buttonArray.count - 1
            let randomInt = Int.random(in: 0...range)
            computerMoves.append(buttonArray[randomInt].tag)
            
            buttonArray[randomInt].setTitle("0", for: .normal)
            buttonArray[randomInt].isUserInteractionEnabled = false
            buttonArray.remove(at: randomInt)
            
            isWin(moves: computerMoves, name: "AI")
        }
    }
    
    func isWin(moves: [Int], name:String) {
        if moves.count >= 3 {
            for win in wins {
                var winConditionCounter = 0
                for element in win {
                    for move in moves {
                        if element == move {
                            winConditionCounter += 1
                        }
                    }
                }
                if winConditionCounter == 3 {
                    presentAlertController(name: name)
                }
            }
        }
    }
    
    func addBorder() {
        for view in viewArray {
            view.layer.borderColor = UIColor.black.cgColor
            view.layer.borderWidth = 1
        }
    }
    
    func presentAlertController(name: String) {
        let alert = UIAlertController(title: nil, message: "\(name) WINs!", preferredStyle: .alert)
        
        let btn = UIAlertAction(title: "To start menu", style: .default) { (_) in
            self.dismiss(animated: true)
        }
        alert.addAction(btn)
        self.present(alert, animated: true, completion: nil)
    }
 

    
    
}
