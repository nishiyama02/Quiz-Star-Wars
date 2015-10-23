//
//  ViewController.swift
//  Quiz
//
//  Created by Matheus Nishiyama on 20/09/15.
//  Copyright © 2015 Matheus Nishiyama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lbQuestion: UILabel!
    @IBOutlet weak var imgQuestion: UIImageView!
    @IBOutlet weak var btnAnswer1: UIButton!
    @IBOutlet weak var btnAnswer2: UIButton!
    @IBOutlet weak var btnAnswer3: UIButton!
    
    @IBOutlet weak var viewFeedback: UIView!
    
    @IBOutlet weak var btnAnswer4: UIButton!
    
    @IBOutlet weak var lblFeddback: UILabel!
    
    @IBOutlet weak var btnFeedback: UIButton!
    
    var questions = [Question]!() // vetor que contem as questoes do quiz
    var currentQuestion = 0 //int que indica qual a questão atual
    var grade = 0.0 //double para o calculo da nota
    var quizEnded = false //Bool que diz se o quiz terminou ou nao
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let q0answer0 = Answer (Answer: "Qui Gon Jinn", isCorrect: true)
        let q0answer1 = Answer (Answer: "Dookan", isCorrect: false)
        let q0answer2 = Answer (Answer: "Mace Windu", isCorrect: false)
        let q0answer3 = Answer (Answer: "Yoda", isCorrect: false)
        let question0 = Question (Question: "Qual o nome do antigo mestre de Obi Wan? ",strImageFaleName: "jedi", answers: [q0answer0, q0answer1,q0answer2,q0answer3])
        
        let q1answer0 = Answer (Answer: "C-3PO", isCorrect: true)
        let q1answer1 = Answer (Answer: "C-3D2", isCorrect: false)
        let q1answer2 = Answer (Answer: "C-3BO", isCorrect: false)
        let q1answer3 = Answer (Answer: "C-3DO", isCorrect: false)
        let question1 = Question (Question: "Qual o nome do andróide que sempre aparece em todos os filmes?",strImageFaleName: "c3po", answers: [q1answer0, q1answer1,q1answer2,q1answer3])
        
        
        let q2answer0 = Answer (Answer: "Luke SkyWalker", isCorrect: true)
        let q2answer1 = Answer (Answer: "Anakin SkyWalker", isCorrect: false)
        let q2answer2 = Answer (Answer: "Obi Wan", isCorrect: false)
        let q2answer3 = Answer (Answer: "Darth Sithious", isCorrect: false)
        let question2 = Question (Question: "Qual o nome do filho de Darth Vader ",strImageFaleName: "darthvader", answers: [q2answer0, q2answer1,q2answer2,q2answer3])
        
        let q3answer0 = Answer (Answer: "Caçador ", isCorrect : true)
        let q3answer1 = Answer (Answer: "Mercador", isCorrect: false)
        let q3answer2 = Answer (Answer: "Jedi", isCorrect: false)
        let q3answer3 = Answer (Answer: "Assassino", isCorrect: false)
        let question3 = Question (Question: "Qual a profissão de Boba Fett? ",strImageFaleName: "boba", answers: [q3answer0, q3answer1,q3answer2,q3answer3])
        
        let q4answer0 = Answer (Answer: "Irmãos ", isCorrect : true)
        let q4answer1 = Answer (Answer: "Primos", isCorrect: false)
        let q4answer2 = Answer (Answer: "Namorados", isCorrect: false)
        let q4answer3 = Answer (Answer: "Cunhados", isCorrect: false)
        let question4 = Question (Question: "O que Luke e Léia são? ",strImageFaleName: "luke", answers: [q4answer0, q4answer1,q4answer2,q4answer3])
        
        let q5answer0 = Answer (Answer: "1977 ", isCorrect : true)
        let q5answer1 = Answer (Answer: "1978", isCorrect: false)
        let q5answer2 = Answer (Answer: "1989", isCorrect: false)
        let q5answer3 = Answer (Answer: "1987", isCorrect: false)
        let question5 = Question (Question: "Em que ano o filme: Star Wars Episódio IV: Uma Nova Esperança foi lançado? ",strImageFaleName: "nova", answers: [q5answer0, q5answer1,q5answer2,q5answer3])
        
        
        
        
        
        questions = [question0,question1,question2,question3,question4,question5]
        
        startQuiz() //começa o quiz
        
    }
    
    // Funcao que reseta o quiz
    func startQuiz (){
        questions.shuffle() //embaralha o vetor das questoes
        for (var i=0; i < questions.count; i++){
            questions[i].answers.shuffle() //embaralha o vetor de respostas de cada questao
        }
        //reseta as variaveis de progresso de usuario
        quizEnded = false
        grade = 0.0
        currentQuestion = 0
        
        showQuestion(0) //mostra a primeira questao
        
    }
    //funcao que atualiza os objetos da tela com os dados do vetor de questoes
    
    func showQuestion (questionid : Int ){
        btnAnswer1.enabled = true
        btnAnswer2.enabled = true
        btnAnswer3.enabled = true
        btnAnswer4.enabled = true
        //atualiza o label de questoes, imagem e texto das 3 botoes de alternativa
        
        lbQuestion.text = questions [questionid].strQuestion
        imgQuestion.image = questions[questionid].imgQuestion
        btnAnswer1.setTitle(questions[questionid].answers[0].strAnswer, forState: UIControlState.Normal)
        btnAnswer2.setTitle(questions[questionid].answers[1].strAnswer, forState: UIControlState.Normal)
        btnAnswer3.setTitle(questions[questionid].answers[2].strAnswer, forState: UIControlState.Normal)
        btnAnswer4.setTitle(questions[questionid].answers[3].strAnswer, forState: UIControlState.Normal)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func chooseAnswer1(sender: AnyObject) {
        selectAnswer(0)
    }
    
    @IBAction func chooseAnswer2(sender: AnyObject) {
        selectAnswer(1)
    }
    
    @IBAction func chooseAnswer3(sender: AnyObject) {
        selectAnswer(2)
    }
    @IBAction func chooseAnswer4(sender: AnyObject) {
        selectAnswer(3)
    }
    
    //funcao que seleciona uma alternativa
    func selectAnswer(answerid: Int){
        // desabilita botoes de alternativa para que não possa clicar 2 vezes
        btnAnswer1.enabled = false
        btnAnswer2.enabled = false
        btnAnswer3.enabled = false
        btnAnswer4.enabled = false
        
        let myGreenColor: UIColor  = UIColor.init(red: 0.0, green: 189.0, blue: 0.0, alpha: 1)
        let myRedColor: UIColor = UIColor.init(red: 171/0, green: 12/93, blue: 12/67
            , alpha: 1);
        let answer: Answer = questions[currentQuestion].answers[answerid] //seleciona resposta
        if (answer.isCorrect == true){
            grade = grade + 1.0 //soma 1 ponto caso a resposta esteja certa
            viewFeedback.backgroundColor = myGreenColor
            lblFeddback.text = answer.strAnswer + "\n Resposta Correta! " // feedBack correto
        } else {
            viewFeedback.backgroundColor = myRedColor
            lblFeddback.text = answer.strAnswer + "\n Resposta Errada..." // feedBack correto
            
        }
        
        if (currentQuestion < questions.count-1) {
            //caso a questao atual nao seja a ultima, atualiza o texto do botão feedBack para proxima
            btnFeedback.setTitle("Próxima", forState: UIControlState.Normal)
        } else {
            //caso a questao atual  seja a ultima, atualiza o texto do botão feedBack para VerNota
            btnFeedback.setTitle("Ver Nota", forState: UIControlState.Normal)
            
        }
        viewFeedback.hidden = false //mostra a view de feedback
    }
    
    @IBAction func chooseAnswerFeedback(sender: AnyObject) {
        viewFeedback.hidden = true //esconde a view Feedback
        
        if(quizEnded){
            startQuiz() //se quiz terminou, comeca de novo
        }else{
            nextQuestion() //se nao terminou mostra proxima questao
            
        }
    }
    //Funcao que mostra a proxima questao, ou final do quiz
    func nextQuestion (){
        currentQuestion++ //incrementa em 1 o valor da variavel que estao atual
        if(currentQuestion < questions.count){
            //se a questao atual e menor que o numero total de questoes, mostra a proxima
            showQuestion(currentQuestion)
            
        }else{
            //se a questao atual e igual ao numero de questoes, encerra o quiz
            endQuiz()
        }
        
    }
    
    //funcao que termina o quiz
    func endQuiz(){
        let myFeedColor: UIColor  = UIColor.init(red: 255.0, green: 189.0, blue: 50.0, alpha: 1)
        grade = grade / Double(questions.count) * 100.0 //calculo da nota 0 a 100
        quizEnded = true //atualiza a variavel Booleana que indica o termino do quiz
        viewFeedback.hidden = false //mostra a view Feedback
         viewFeedback.backgroundColor = myFeedColor
        lblFeddback.text = "Sua Nota: \(grade) - \nMATHEUS-COURSERA" //atualiza o texto feedback mostrando sua nota
        btnFeedback.setTitle("Refazer", forState: UIControlState.Normal) //atualiza o texto do botao feedback
        
    }
    
    
    
}

