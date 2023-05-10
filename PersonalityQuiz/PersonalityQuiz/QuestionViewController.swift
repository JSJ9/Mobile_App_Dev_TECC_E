//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by JIMENEZ, JANINE on 4/27/23.
//

import Foundation
import UIKit

class QuestionViewController: UIViewController {
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButton1: UIButton!
    @IBOutlet var singleButton2: UIButton!
    @IBOutlet var singleButton3: UIButton!
    @IBOutlet var singleButton4: UIButton!
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multiLabel1: UILabel!
    @IBOutlet var multiLabel2: UILabel!
    @IBOutlet var multiLabel3: UILabel!
    @IBOutlet var multiLabel4: UILabel!
    
    @IBOutlet var multiSwitch1: UISwitch!
    @IBOutlet var multiSwitch2: UISwitch!
    @IBOutlet var multiSwitch3: UISwitch!
    @IBOutlet var multiSwitch4: UISwitch!
    
    @IBOutlet var rangedStackView: UIStackView!
    @IBOutlet var rangedLabel1: UILabel!
    @IBOutlet var rangedLabel2: UILabel!
    @IBOutlet var rangedSlider: UISlider!
    
    @IBOutlet var questionLabel : UILabel!
    @IBOutlet var questionProgressView: UIProgressView!
    
    
    var questions: [Question] = [
        Question(text:"Which food do you like the most?",
                 type: .single,
                 answers: [
                    Answer(text: "Sandwich", type: .shaggy),
                    Answer(text: "Cookies", type: .Scooby),
                    Answer(text: "Fruit Parfait", type: .Daphne),
                    Answer(text: "Malted milk shake", type: .Velma),
                    Answer(text: "Beignets", type: .fred)
                 ]),
        Question(text:"Which activities do you enjoy?",
                 type: .multiple,
                 answers: [
                    Answer(text: "Cooking", type: .shaggy),
                    Answer(text: "Exploring", type: .Scooby),
                    Answer(text: "Singing", type: .Daphne),
                    Answer(text: "Reading", type: .Velma),
                    Answer(text: "weightlifting", type: .fred)
                 ]),
        Question(text:"How much do you enjoy traveling?",
                 type: .ranged,
                 answers: [
                    Answer(text: "I don't like it", type: .Velma),
                    Answer(text: "I can deal with it", type: .Daphne),
                    Answer(text: "It's alright, I don't really mind", type: .shaggy),
                    Answer(text: "I like it!", type: .fred),
                    Answer(text: "I love it!", type: .Scooby)
                 ]),
    ]
    
    var questionIndex = 0
    
    var answersChosen: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        navigationItem.title = "Question \(questionIndex+1)"
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: currentAnswers)
        case .ranged:
            updateRangedStack(using: currentAnswers)
        case .multiple:
            updateMultipleStack(using: currentAnswers)
        }
    }
        
        func updateSingleStack(using answers: [Answer]) {
            singleStackView.isHidden = false
            singleButton1.setTitle(answers[0].text, for: .normal)
            singleButton2.setTitle(answers[1].text, for: .normal)
            singleButton3.setTitle(answers[2].text, for: .normal)
            singleButton4.setTitle(answers[3].text, for: .normal)
        }
        
        func updateRangedStack(using answers: [Answer]) {
            rangedStackView.isHidden = false
            rangedSlider.setValue(0.5, animated: false)
            rangedLabel1.text = answers.first?.text
            rangedLabel2.text = answers.last?.text
            
        }
        
        func updateMultipleStack(using answers: [Answer]) {
            multipleStackView.isHidden = false
            
            multiSwitch1.isOn = false
            multiSwitch2.isOn = false
            multiSwitch3.isOn = false
            multiSwitch4.isOn = false
            
            multiLabel1.text = answers[0].text
            multiLabel2.text = answers[1].text
            multiLabel3.text = answers[2].text
            multiLabel4.text = answers[3].text
        }
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        
        switch sender {
        case singleButton1:
            answersChosen.append(currentAnswers[0])
        case singleButton2:
            answersChosen.append(currentAnswers[1])
        case singleButton3:
            answersChosen.append(currentAnswers[2])
        case singleButton4:
            answersChosen.append(currentAnswers[3])
        default:
            break
        }
        
        nextQuestion()
    }
    
    @IBAction func multipleAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        
        if multiSwitch1.isOn {
            answersChosen.append(currentAnswers[0])
        }
        if multiSwitch2.isOn {
            answersChosen.append(currentAnswers[1])
        }
        if multiSwitch3.isOn {
            answersChosen.append(currentAnswers[2])
        }
        if multiSwitch4.isOn {
            answersChosen.append(currentAnswers[3])
        }
        
        nextQuestion()
    }
    
    @IBAction func rangedAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        
        answersChosen.append(currentAnswers[index])
        
        nextQuestion()
        
    }
    
    func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        }else {
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultsSegue" {
            let resultsViewController = segue.destination as! ResultsViewController
            resultsViewController.responses = answersChosen
        }
    }
    
}
