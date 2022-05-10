//
//  GameTestCase.swift
//  Labo 1Tests
//
//  Created by Alain Bernier on 2022-05-02.
//  Copyright © 2022 Ahuntsic. All rights reserved.
//

import XCTest
@testable import Labo_1

class GameTestCase: XCTestCase {

    var game: Game!
    override func setUp() {
    super.setUp()
    game = Game()
}


 func testGivenTwoTrueQuestions_WhenAnsweringTrue_ThenScoreIsOneAndGameOnGoing()  {
    // Given

    var questions = [Question]()

    questions.append(Question(title: "Q1", isCorrect: true))
    questions.append(Question(title: "Q2", isCorrect: true))

     // When
    game.setGameQuestions(questions)
    game.answerCurrentQuestion(with: true)

     // Then
    XCTAssert(game.score == 1)
    XCTAssert(game.state == .ongoing)

}
    func testGivenTwoFalseQuestions_WhenAnsweringFalse_ThenScoreIsOneAndGameOnGoing()  {
       // Given

       var questions = [Question]()

       questions.append(Question(title: "Q1", isCorrect: false))
       questions.append(Question(title: "Q2", isCorrect: false))

        // When
       game.setGameQuestions(questions)
       game.answerCurrentQuestion(with: false)

        // Then
       XCTAssert(game.score == 1)
       XCTAssert(game.state == .ongoing)

   }

func testGivenOneTrueQuestion_WhenAnsweringFalse_ThenScoreIs0AndGameOver() {
    // Given
    var questions = [Question]()
    questions.append(Question(title: "Q1", isCorrect: true))

    // When
    game.setGameQuestions(questions)
    game.answerCurrentQuestion(with: false)

    // Then
    XCTAssert(game.score == 0)
    XCTAssert(game.state == .over)

}

func testGivenOneTrueQuestion_WhenAnsweringTrue_ThenScoreIs1AndGameOver() {

    // Given
    var questions = [Question]()

    questions.append(Question(title: "Q1", isCorrect: true))
    game.setGameQuestions(questions)

    // When
    game.answerCurrentQuestion(with: false)

    // Then
    XCTAssert(game.score == 0)
    XCTAssert(game.state == .over)
}

func testGivenEmptyQuestionnaire_WhenSetGameQuestions_ThenGameIsOnGoingAndCurrentQuestionMatchesExcpectedTitle() {
    //Given

    var questions = [Question]()
    let question = Question(title: "Test pour vérifier la question", isCorrect: true)

    //When
    questions.append(question)


    game.state = .ongoing
    game.setGameQuestions(questions)

    // Then
    XCTAssertEqual( game.currentQuestion.title, question.title)
    XCTAssert(game.state == .ongoing)
    }


func testGivenScoreIsTwo_WhenRefreshIsCalled_ThenScoreIs0() {

    game.score = 2

    game.refresh()

    XCTAssert(game.score == 0)

    }
}
