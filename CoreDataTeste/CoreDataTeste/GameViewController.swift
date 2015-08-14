//
//  GameViewController.swift
//  CoreDataTeste
//
//  Created by Patricia de Abreu on 11/08/15.
//  Copyright (c) 2015 Patricia de Abreu. All rights reserved.
//

import UIKit
import SpriteKit
import MediaPlayer
import AVFoundation

extension SKNode {
    class func unarchiveFromFile(file : String) -> SKNode? {
        if let path = NSBundle.mainBundle().pathForResource(file, ofType: "sks") {
            var sceneData = NSData(contentsOfFile: path, options: .DataReadingMappedIfSafe, error: nil)!
            var archiver = NSKeyedUnarchiver(forReadingWithData: sceneData)
            
            archiver.setClass(self.classForKeyedUnarchiver(), forClassName: "SKScene")
            let scene = archiver.decodeObjectForKey(NSKeyedArchiveRootObjectKey) as! GameScene
            archiver.finishDecoding()
            return scene
        } else {
            return nil
        }
    }
}

class GameViewController: UIViewController {

    var movie: MPMoviePlayerController?
    var audio: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        super.viewDidLoad()
        let scene = GameScene()
        scene.size = view.bounds.size
        scene.backgroundColor = UIColor.whiteColor()
        scene.scaleMode = .ResizeFill
        let skView:SKView = SKView(frame: self.view.frame)
        scene.gameController = self
        self.view.addSubview(skView)
        skView.presentScene(scene)

//        playMovie()
//        movie?.play()
//        
//        playAudio()
        

    }

//    override func shouldAutorotate() -> Bool {
//        return true
//    }

//    override func supportedInterfaceOrientations() -> Int {
//        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
//            return Int(UIInterfaceOrientationMask.AllButUpsideDown.rawValue)
//        } else {
//            return Int(UIInterfaceOrientationMask.All.rawValue)
//        }
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func playMovie(){
        
        if let path = NSBundle.mainBundle().pathForResource("teste", ofType: "m4v"), let url = NSURL.fileURLWithPath(path), let movie = MPMoviePlayerController(contentURL: url){
            
            self.movie = movie
            movie.view.frame = CGRect(x: 250, y: 400, width: 300, height: 300)
            movie.scalingMode = .AspectFill
            self.view.addSubview(movie.view)
        }else{
            debugPrint("Video não encontrado")
        }
    }
    
    func playAudio(){
        
        let path = NSBundle.mainBundle().pathForResource("testeAudio", ofType: "m4a")
        let url = NSURL(fileURLWithPath: path!)
        self.audio = AVAudioPlayer(contentsOfURL: url, error: nil)
        self.audio.prepareToPlay()
        self.audio.play()
        
    }
}
