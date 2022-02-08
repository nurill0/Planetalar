//
//  QuizData.swift
//  Planetalar
//
//  Created by Nurillo Domlajonov on 05/02/22.
//

import UIKit

struct Question {
    let titleImage: String
    let taskLabel : String
    let choose1   : String
    let choose2   : String
    let choose3   : String
    let answer    : String
}
struct QuestionData{
    var questionNumber = 0
    var score          = 0
    var numberOfQuiz   = 0
    var isFinish = false
    var dataOfQuiz: [Question] = [
        Question(titleImage: "1", taskLabel: "Quyoshning markaziy qismi nimadan tashkil topgan?", choose1: "Koinot changlari", choose2: "Plazmadan", choose3: "Lavadan", answer: "Plazmadan"),
        Question(titleImage: "2", taskLabel: "Merkuriyning Quyosh atrofida aylanish davri necha sutka?", choose1: "87", choose2: "77", choose3: "88", answer: "88"),
        Question(titleImage: "3", taskLabel: "Venera sayyorasining yana bir nomi?", choose1: "Zuhra", choose2: "Katta ayiq", choose3: "Zuhal", answer: "Zuhra"),
        Question(titleImage: "4", taskLabel: "Hajmi va massasi jihatidan Yer katta sayyoralar ichida (Yupiter, Saturn, Uran, Neptundam keyin) nechinchi oʻrinda?", choose1: "Beshinchi", choose2: "Oltinchi", choose3: "Uchinchi", answer: "Beshinchi"),
        Question(titleImage: "5", taskLabel: "Oy yerdan oʻrtacha  masofada joylashgan?", choose1: "584 400 km", choose2: "484 400 km", choose3: "384 400 km", answer: "384 400 km"),
        Question(titleImage: "6", taskLabel: "Mars quyoshga nisbatan Merkuriy, Venera va Yer orbitalaridan keyin  joylashgan?", choose1: "2-oʻrinda", choose2: "4-oʻrinda", choose3: "3-oʻrinda", answer: "4-oʻrinda"),
        Question(titleImage: "7", taskLabel: "Yupiter quyoshdan uzoqligi boʻyicha nechanchi sayyora?", choose1: "Beshinchi", choose2: "Uchinchi", choose3: "Oltinchi", answer: "Beshinchi"),
        Question(titleImage: "8", taskLabel: "Saturn sayyorasining yana bir nomi?", choose1: "Zuhra", choose2: "Zuhal", choose3: "Katta ayiq", answer: "Zuhal"),
        Question(titleImage: "9", taskLabel: "Quyoshdan uzoqligi  astronomik birlikga teng?", choose1: "18,19", choose2: "17,19", choose3: "19,19", answer: "19,19"),
        Question(titleImage: "10", taskLabel: "Neptunning ekvatorial radiusi necha km? ", choose1: "24850 km", choose2: "24750 km", choose3: "24650 km", answer: "24750 km")
    ]
  
   
  
    
    
    //MARK: BUTTONGA JAOVBLARNI ULASH
    func getAnswer()->[String]{
        let answer = [
            dataOfQuiz[questionNumber].choose1,
            dataOfQuiz[questionNumber].choose2,
            dataOfQuiz[questionNumber].choose3,
        ]
        return answer
    }
    //MARK: RASMLARNI ULASH
    func getTaskImage()->String{
        return dataOfQuiz[questionNumber].titleImage
    }
    //MARK: SAVOLLARNI LABELGA ULASH
    func getQuestionLabel()->String{
        return dataOfQuiz[questionNumber].taskLabel
    }
    //MARK: keyngi savolga o`tish
    mutating func nextQuestion(){
        if questionNumber < dataOfQuiz.count - 1 {
            questionNumber += 1
            isFinish = false
            
        }
        else{
            isFinish = true
            questionNumber = 0
        }
    }
    
    //MARK: savol raqamini olish
    func getQuestionNumber()->Int{
        return questionNumber
    }
    //MARK: javob to`g`ri noto`g`rililigini tekshirish
    mutating func checkAnswer(userAnswer: String)->Bool{
        if userAnswer == dataOfQuiz[questionNumber].answer{
            score+=1
            return true
        } else{
            return false
        }
    }
    //MARK: Shotni yuborish
    func getScore()->Int{
        return score
    }
    
    
    
}

