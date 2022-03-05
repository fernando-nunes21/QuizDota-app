//
//  QuestionViewController.swift
//  quizDota-app
//
//  Created by Fernando on 23/02/22.
//

import UIKit

class QuestionViewController: UIViewController {

    let BUTTON_INDEX_ZERO = 0
    let BUTTON_INDEX_ONE = 1
    let BUTTON_INDEX_TWO = 2
    let BUTTON_INDEX_THREE = 3
    
    @IBOutlet weak var questionImage: UIImageView!
    
    @IBOutlet weak var stackButtons: UIStackView!
   
    @IBAction func button1(_ sender: Any) {
        verifyAnswer(BUTTON_INDEX_ZERO)
    }
    
    @IBAction func button2(_ sender: Any) {
        verifyAnswer(BUTTON_INDEX_ONE)
    }

    @IBAction func button3(_ sender: Any) {
        verifyAnswer(BUTTON_INDEX_TWO)
    }
    
    @IBAction func button4(_ sender: Any) {
        verifyAnswer(BUTTON_INDEX_THREE)
    }
    
    var heroesAnswer : [String] = ["Doctor", "TerrorBlade", "Drow", "Shaman"]
    var optionsHeroes : [String] = ["Doctor", "TerrorBlade", "Drow", "Antimage", "Axe", "Luna", "Shaman"]
    var rightAnswerIndex = 0
    var gameScore : Int = 0

    func loadQuestions(){
        if(heroesAnswer.count == 0){
            performSegue(withIdentifier: "endgame", sender: self)
            return
        }
        
        let answerIndex = Int(arc4random_uniform(UInt32(heroesAnswer.count)))
        let answer = heroesAnswer[answerIndex]
        heroesAnswer.remove(at: answerIndex)
        
        let heroImage = answer.lowercased() + ".png"
        questionImage.image = UIImage(named: heroImage)
        
        var optionsHeroesShuffled = generateOptionsForHero(optionsHeroes: optionsHeroes)
        for (index, option) in optionsHeroesShuffled.enumerated(){
            if option == answer{
                rightAnswerIndex = index
                break
            }
        }
        
        if (rightAnswerIndex >= 4){
            let newRightAnswer = Int(arc4random_uniform(UInt32(4)))
            optionsHeroesShuffled.swapAt(rightAnswerIndex, newRightAnswer)
            rightAnswerIndex = newRightAnswer
        }
        
        setButtonAnswers(optionsHeroesShuffled: optionsHeroesShuffled)
    }

    func generateOptionsForHero(optionsHeroes : [String]) -> [String]{
        var optionsHeroesShuffled = optionsHeroes
        
        if(optionsHeroes.count < 2){
            return optionsHeroes
        }
        
        for i in 0 ..< optionsHeroes.count - 1 {
            let j = Int(arc4random_uniform(UInt32(optionsHeroes.endIndex - i))) + i
            if i != j {
                optionsHeroesShuffled.swapAt(i, j)
            }
        }
        return optionsHeroesShuffled
    }
    
    func setButtonAnswers(optionsHeroesShuffled : [String]){
        var answerIndex = 0
        for view in stackButtons.subviews {
            if let btn = view as? UIButton {
                btn.setTitle(optionsHeroesShuffled[answerIndex], for: .normal)
                answerIndex += 1
            }
        }
    }
    
    func verifyAnswer(_ index : Int){
        if(index == rightAnswerIndex){
            gameScore += 1
        } else{
            performSegue(withIdentifier: "endgame", sender: self)
        }
        loadQuestions()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadQuestions()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let endGameViewController = segue.destination as? EndGameViewController {
            endGameViewController.score = self.gameScore
        }
    }
    
    
}
