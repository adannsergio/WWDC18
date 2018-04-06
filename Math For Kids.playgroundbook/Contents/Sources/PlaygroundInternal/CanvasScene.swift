//
//  CanvasScene.swift
//
//
//  Created by Adann Simões on 23/03/18.
//

import UIKit
import PlaygroundSupport

public func _canvasScene() {
    //#-hidden-code
    let txtQuestion = Text(string: "HOW MANY DINOSAURS BELOW ?", fontSize: 30)
    txtQuestion.center.y += 33
    
    let image = Image(name: "BoardBlack")
    image.size.width *= 2.5
    image.size.height *= 4
    image.center.y += 12
    
    let operation = Text(string: "+", fontSize: 70, color: .white)
    operation.center.y += 18
    
    let line = Line(start: Point(x: -15, y: 0), end: Point(x: 15, y: 0), thickness: 0.5)
    line.center.y += 9
    line.color = .white
    //#-end-hidden-code
}

