//
//  GameScene.swift
//  CoreDataTeste
//
//  Created by Patricia de Abreu on 11/08/15.
//  Copyright (c) 2015 Patricia de Abreu. All rights reserved.
//

import SpriteKit

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
    
    override func didMoveToView(view: SKView) {
        montarScene()
        /* Setup your scene here */
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {

        let touch = touches.first as! UITouch
        let touchLocation = touch.locationInNode(self)
        
        var toc = self.nodeAtPoint(touchLocation)
        
        if toc.name == "bolo" {
//            bolo.runAction(SKAction .colorizeWithColor(UIColor.redColor(), colorBlendFactor: 0.0, duration: 0.4))
            tocado = bolo
//            tocado.color = UIColor.redColor()
        }else if toc.name == "bolo1" {
            tocado = bolo1
//            tocado.color = UIColor.greenColor()
        }else if toc.name == "bolo2" {
            tocado = bolo2
        }else if toc.name == "red" {
            tocado.color = UIColor.redColor()
        }else if toc.name == "green" {
            tocado.color = UIColor.greenColor()
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
        bolo1.color = UIColor.grayColor()
        bolo1.position = CGPoint(x: 500, y: 504)
        
        bolo2 = SKSpriteNode(imageNamed: "boloBran2")
        bolo2.zPosition = 1
        bolo2.colorBlendFactor = 1
        bolo2.name = "bolo2"
        bolo2.color = UIColor.blackColor()
        bolo2.position = CGPoint(x: 500, y: 505)
        
        moldura = SKSpriteNode(imageNamed: "boloMold2")
        moldura.zPosition = 1
        moldura.name = "moldura"
        moldura.position = CGPoint(x: 500, y: 500)
        
        moldura1 = SKSpriteNode(imageNamed: "boloMold3")
        moldura1.zPosition = 1
        moldura1.name = "moldura1"
        moldura1.position = CGPoint(x: 500, y: 505)
        
        moldura2 = SKSpriteNode(imageNamed: "boloMold1")
        moldura2.zPosition = 1
        moldura2.name = "moldura2"
        moldura2.position = CGPoint(x: 500, y: 504)
        
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
//        addChild(bolo2)
        
        addChild(cor)
        addChild(cor1)
    }
}
