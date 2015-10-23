//
//  QuizModel.swift
//  Quiz
//
//  Created by Matheus Nishiyama on 21/09/15.
//  Copyright © 2015 Matheus Nishiyama. All rights reserved.
//

import Foundation
import UIKit

class Question {
    var strQuestion: String! //string para armazenar o texto da questão
    var imgQuestion: UIImage! //UIImage para armazenar a imagem para ilustrar a pergunta
    var answers: [Answer]! //vetor de objetos da classe Answer para armazenar respostas
    
    //função que inicializa  objeto da classe Question
    
    init (Question: String, strImageFaleName : String, answers : [Answer]){
        self.strQuestion = Question
        self.imgQuestion = UIImage (named: strImageFaleName)
        self.answers = answers
    }
}

class Answer {
    var strAnswer : String! //String para armazenar o texto da resposta
    var isCorrect : Bool! //Booleana para armazenar se a resposta é certa ou não
    
    //Fun;cão que incializa o objeto da classe Answer
    init (Answer : String, isCorrect: Bool){
        self.strAnswer = Answer
        self.isCorrect = isCorrect
        
    }
}