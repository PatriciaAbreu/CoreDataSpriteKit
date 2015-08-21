//
//  GameScene.swift
//  CoreDataTeste
//
//  Created by Patricia de Abreu on 11/08/15.
//  Copyright (c) 2015 Patricia de Abreu. All rights reserved.
//

import SpriteKit
import MediaPlayer
import AVFoundation

class GameScene: SKScene {
    
    var gameController: GameViewController!
    
    var bolo: SKSpriteNode!
    var bolo1: SKSpriteNode!
    var bolo2: SKSpriteNode!
    var moldura: SKSpriteNode!
    var moldura1: SKSpriteNode!
    var moldura2: SKSpriteNode!
    
    var tocado: SKSpriteNode!
    var cor: SKSpriteNode!
    var cor1: SKSpriteNode!
    
    var movie: MPMoviePlayerController?
    var audio: AVAudioPlayer!

    //----------------------------------------
    
    var fundo: SKSpriteNode!
    var toy1: SKSpriteNode!
    var toy2: SKSpriteNode!
    var toy3: SKSpriteNode!
    var toy4: SKSpriteNode!
    var toy5: SKSpriteNode!
    var toy6: SKSpriteNode!
    var toy7: SKSpriteNode!
    var toy8: SKSpriteNode!
    var toy9: SKSpriteNode!
    var sofa: SKSpriteNode!

    var julia: SKSpriteNode!
    
    var num0: SKSpriteNode!
    var num1: SKSpriteNode!
    var num2: SKSpriteNode!
    var num3: SKSpriteNode!
    
    override func didMoveToView(view: SKView) {
        
        montarScene2()
        testeJSON()
        
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {

        let touch = touches.first as! UITouch
        let touchLocation = touch.locationInNode(self)
        
        var toc = self.nodeAtPoint(touchLocation)
        
//        if toc.name == "bolo1" {
////            bolo.runAction(SKAction .colorizeWithColor(UIColor.redColor(), colorBlendFactor: 0.0, duration: 0.4))
//
//            tocado = bolo1
////            tocado.color = UIColor.redColor()
//        }else if toc.name == "bolo" {
//
//            tocado = bolo
////            tocado.color = UIColor.greenColor()
//        }else if toc.name == "bolo2" {
//
//            tocado = bolo2
//        }else if toc.name == "red" {
//            tocado.color = UIColor.redColor()
//        }else if toc.name == "green" {
//            tocado.color = UIColor.greenColor()
//        }
        
        
        //-------------------
        if toc.name == "num0" && tocado == nil{
            tocado = num0
            println(num0.name)
        }else if (toc.name == "num1" && tocado != nil) {
            if tocado.name == "num0" {
                tocado = num1
                println(num1.name)
            }
        }else if (toc.name == "num2" && tocado != nil) {
            if tocado.name == "num1" {
                tocado = num2
                println(num2.name)
            }
        }else if (toc.name == "num3" && tocado != nil) {
            if tocado.name == "num2" {
                tocado = num3
                println(num3.name)
            }
        }else if (toc.name == "julia" && tocado != nil) {
            if tocado.name == "num3" {
            toy1.removeFromParent()
//            addChild(toy1)
            julia.runAction(SKAction.scaleTo(2, duration: 0.3))
            tocado = nil
        }
        }
    }
   
     override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func montarScene(){
        
        bolo = SKSpriteNode(imageNamed: "boloBran1")
        bolo.zPosition = 1
        bolo.colorBlendFactor = 1
        bolo.name = "bolo"
        bolo.color = UIColor.redColor()
        bolo.position = CGPoint(x: 500, y: 500)
        
        bolo1 = SKSpriteNode(imageNamed: "boloBran3")
        bolo1.zPosition = 1
        bolo1.colorBlendFactor = 1
        bolo1.name = "bolo1"
        bolo1.color = UIColor.blackColor()
        bolo1.position = CGPoint(x: 500, y: 550)
        
        bolo2 = SKSpriteNode(imageNamed: "boloBran2")
        bolo2.zPosition = 1
        bolo2.colorBlendFactor = 1
        bolo2.name = "bolo2"
        bolo2.color = UIColor.grayColor()
        bolo2.position = CGPoint(x: 500, y: 600)
        
        moldura = SKSpriteNode(imageNamed: "boloMold2")
        moldura.zPosition = 1
        moldura.name = "moldura"
        moldura.position = CGPoint(x: 500, y: 500)
        
        moldura1 = SKSpriteNode(imageNamed: "boloMold1")
        moldura1.zPosition = 1
        moldura1.name = "moldura1"
        moldura1.position = CGPoint(x: 500, y: 550)

        moldura2 = SKSpriteNode(imageNamed: "boloMold3")
        moldura2.zPosition = 1
        moldura2.name = "moldura2"
        moldura2.position = CGPoint(x: 500, y: 600)
        
        cor = SKSpriteNode()
        cor.zPosition = 1
        cor.name = "red"
        cor.color = UIColor.redColor()
        cor.position = CGPoint(x: 100, y: 100)
        cor.size = CGSize(width: 50, height: 50)
        
        cor1 = SKSpriteNode()
        cor1.zPosition = 1
        cor1.name = "green"
        cor1.color = UIColor.greenColor()
        cor1.position = CGPoint(x: 100, y: 200)
        cor1.size = CGSize(width: 50, height: 50)
        
        addChild(moldura)
        addChild(moldura1)
        addChild(moldura2)
        
        addChild(bolo)
        addChild(bolo1)
        addChild(bolo2)
        
        addChild(cor)
        addChild(cor1)
    }
    
    func testeJSON(){
        
        let path: NSString = NSBundle.mainBundle().pathForResource("testeJSON", ofType: "json")!
        var data: NSData = NSData(contentsOfFile: path as String, options: NSDataReadingOptions.DataReadingMapped, error: nil)!
        var dict: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
        println(dict)
        
        var exercicios = dict.objectForKey("exercicios") as! NSArray
        println(exercicios)
        
        var exercicio = exercicios.objectAtIndex(0) as! NSDictionary
        println(exercicio)
        
        var texto = exercicio.objectForKey("texto") as! NSString
        println(texto)
        
        var video = exercicio.objectForKey("video") as! NSString
        println(video)
        
        var tipoVideo = exercicio.objectForKey("tipoVideo") as! NSString
        println(tipoVideo)
        
        var audio = exercicio.objectForKey("audio") as! NSString
        println(audio)
        
        var tipoAudio = exercicio.objectForKey("tipoAudio") as! NSString
        println(tipoAudio)
        
        playAudio(audio as String, tipo: tipoAudio as String)
        
        var resultado = exercicio.objectForKey("resultado") as! NSString
        println(resultado)
        
        playMovie(video as String, tipo: tipoVideo as String)
        movie?.play()
        playAudio(audio as String, tipo: tipoAudio as String)

    }
    
    func playMovie(var video: String, var tipo: String){
        
        if let path = NSBundle.mainBundle().pathForResource(video, ofType: tipo), let url = NSURL.fileURLWithPath(path), let movie = MPMoviePlayerController(contentURL: url){
            
            self.movie = movie
            movie.view.frame = CGRect(x: 20, y: 20, width: 300, height: 300)
            movie.view.layer.zPosition = 1
            movie.scalingMode = .AspectFill
            self.view!.addSubview(movie.view)
        }else{
            debugPrint("Video não encontrado")
        }
    }
    
    func playAudio(var audio: String, var tipo: String){
        
        let path = NSBundle.mainBundle().pathForResource(audio, ofType: tipo)
        let url = NSURL(fileURLWithPath: path!)
        self.audio = AVAudioPlayer(contentsOfURL: url, error: nil)
        self.audio.prepareToPlay()
        self.audio.play()
        
    }
    
    func montarScene2(){
        
        //imagem de plano de fundo
        fundo = SKSpriteNode(imageNamed: "fundo_sala_brinquedos")
        fundo.zPosition = 1
        fundo.name = "fundo_sala"
        fundo.size = CGSize(width: 1050, height: 800)
        fundo.position = CGPoint(x: 510, y: 400)
        
        // colocando os brinquedos
        toy1 = SKSpriteNode(imageNamed: "toy5")
        toy1.zPosition = 1
        toy1.name = "toy1"
        toy1.size = CGSize(width: 150, height: 200)
        toy1.position = CGPoint(x: 300, y: 100)
        
        toy2 = SKSpriteNode(imageNamed: "toy2")
        toy2.zPosition = 1
        toy2.name = "toy2"
        toy2.size = CGSize(width: 100, height: 200)
        toy2.position = CGPoint(x: 400, y: 400)
        
        //personagem que deve ser procurado
        julia = SKSpriteNode(imageNamed: "julia")
        julia.zPosition = 1
        julia.name = "julia"
        julia.size = CGSize(width: 150, height: 200)
        julia.position = CGPoint(x: 250, y: 150)
        
        //numeros da contagem
        num0 = SKSpriteNode(imageNamed: "num0")
        num0.zPosition = 1
        num0.name = "num0"
        num0.size = CGSize(width: 50, height: 50)
        num0.position = CGPoint(x: 950, y: 700)
        
        num1 = SKSpriteNode(imageNamed: "num1")
        num1.zPosition = 1
        num1.name = "num1"
        num1.size = CGSize(width: 50, height: 50)
        num1.position = CGPoint(x: 800, y: 600)
        
        num2 = SKSpriteNode(imageNamed: "num2")
        num2.zPosition = 1
        num2.name = "num2"
        num2.size = CGSize(width: 50, height: 50)
        num2.position = CGPoint(x: 890, y: 650)
        
        num3 = SKSpriteNode(imageNamed: "num3")
        num3.zPosition = 1
        num3.name = "num3"
        num3.size = CGSize(width: 50, height: 50)
        num3.position = CGPoint(x: 920, y: 580)
        
        addChild(fundo)
        addChild(julia)
        addChild(toy1)
//        addChild(toy2)
        
        addChild(num0)
        addChild(num1)
        addChild(num2)
        addChild(num3)
    }

}
