//
//  JSON.swift
//  CoreDataTeste
//
//  Created by Patricia de Abreu on 20/08/15.
//  Copyright (c) 2015 Patricia de Abreu. All rights reserved.
//

import UIKit

class JSON: NSObject {
    
    func busca(){
        var jData = NSData(contentsOfFile: "testeJSON.pages")
        
        var arrayDeResultados: NSArray
        var result: NSDictionary
        var nomeRep: Array<String> = []

        arrayDeResultados = NSJSONSerialization.JSONObjectWithData(jData!, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSArray
        
        
    }
    

}