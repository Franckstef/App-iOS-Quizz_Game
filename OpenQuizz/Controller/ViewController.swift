//
//  ViewController.swift
//  OpenQuizz
//
//  Created by Vincent Leduc on 2020-06-05.
//  Copyright © 2020 Ahuntsic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true)
    }
    var game = Game()
    var gameStat = GameStats()
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var questionView: QuestionView!
    @IBOutlet weak var newGameButton: UIButton!

    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(questionsLoaded), name: Game.questionsLoadedNotifName, object: nil)
        
        startNewGame()
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(dragQuestionView(_:)))
        questionView.addGestureRecognizer(panGestureRecognizer)
    }
    
    @objc func questionsLoaded() {
        activityIndicator.isHidden = true
        newGameButton.isHidden = false
        questionView.title = game.currentQuestion.title
    }
    
    @objc func dragQuestionView(_ sender: UIPanGestureRecognizer) {
        //print("dragQuestionView")
        if game.state == .ongoing {
            switch sender.state {
            case .began, .changed:
                transformQuestionViewWith(gesture: sender)
            case .ended, .cancelled:
                answerQuestion()
            default:
                break
            }
        }
    }

    private func transformQuestionViewWith(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: questionView)

        let translationTransform = CGAffineTransform(translationX: translation.x, y: translation.y)

        let translationPercent = translation.x/(UIScreen.main.bounds.width / 2)
        let rotationAngle = (CGFloat.pi / 3) * translationPercent
        let rotationTransform = CGAffineTransform(rotationAngle: rotationAngle)

        let transform = translationTransform.concatenating(rotationTransform)
        questionView.transform = transform

        if translation.x > 0 {
            questionView.style = .correct
        } else {
            questionView.style = .incorrect
        }
    }

    private func answerQuestion() {
        switch questionView.style {
        case .correct:
            game.answerCurrentQuestion(with: true)
        case .incorrect:
            game.answerCurrentQuestion(with: false)
        case .standard:
            break
        }
        scoreLabel.text = "\(game.score) / 10"
        
        let screenWidth = UIScreen.main.bounds.width
        var translationTransform: CGAffineTransform
        if questionView.style == .correct {
            translationTransform = CGAffineTransform(translationX: screenWidth, y: 0)
        } else {
            translationTransform = CGAffineTransform(translationX: -screenWidth, y: 0)
        }
        UIView.animate(withDuration: 0.3, animations: {
            self.questionView.transform = translationTransform
        }, completion: { (success) in
            if success {
                self.showQuestionView()
            }
        })
    }
    
    private func showQuestionView() {
        questionView.transform = .identity
        questionView.style = .standard

        switch game.state {
        case .ongoing:
            questionView.title = game.currentQuestion.title
        case .over:
            questionView.title = "Game Over"
            
        }
        
        questionView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: {
            self.questionView.transform = .identity
        }, completion:nil)
    }
    
    @IBAction func didTapNewGameButton() {
        startNewGame()
    }
    
    private func startNewGame() {
        activityIndicator.isHidden = false
        newGameButton.isHidden = true
        questionView.title = "Loading..."
        questionView.style = .standard
        scoreLabel.text = "0 / 10"
        
        game.refresh()
    }
    
 
}

