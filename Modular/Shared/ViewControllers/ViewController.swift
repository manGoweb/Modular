//
//  ViewController.swift
//  Modular
//
//  Created by Ondrej Rafaj on 12/02/2017.
//  Copyright (c) 2017 Ondrej Rafaj. All rights reserved.
//

import UIKit
import Modular


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Make a view and fill all space with it
        let canvas1 = RandomView()
        canvas1.place.on(andFill: view)
        
        let view1 = RandomView()
        view1.place.on(canvas1, height: 20).with.top().and.sideToSide()
        
        let label1 = RandomLabel()
        label1.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit.\nUt eu viverra orci. Morbi nulla diam, ornare sit amet bibendum aliquet, lacinia et purus. Ut lacinia bibendum dapibus."
        label1.place.below(view1).with.sides()
        
        // Make a square view and place it to the left
        let view2 = RandomView()
        view2.place.below(label1).make.square(side: 40).add.left()
        
        // Make a circle and place it next to the previous view
        let circle1 = RandomView()
        circle1.place.next(to: view2).make.circle(radius: 30)
        
        // View will be placed below the one that is lowest
        let view3 = RandomView()
        view3.place.below([view2, circle1], height: 40).with.sides()
        
        // Two views on sides with one filling space in the middle
        let canvas2 = RandomView()
        canvas2.place.below(view3).sides()
        
        let leftView1 = RandomView()
        leftView1.place.on(canvas2).add.top().make.rectangle(width: 30, height: 30).with.left().and.min(bottom: DefaultValues.bottomMargin)
        
        let rightView1 = RandomView()
        rightView1.place.on(canvas2).add.top().make.rectangle(width: 30, height: 10).with.right().min(bottom: DefaultValues.bottomMargin)
        
        let middleView1 = RandomView()
        middleView1.place.between(leftView1, and: rightView1, height: 50).with.min(bottom: DefaultValues.bottomMargin)
        
        // Making a horizontal stack view
        let views = [
            RandomView().make.square().width(30).view,
            RandomView().make.circle(radius: 10).view,
            RandomView().make.rectangle(width: 20, height: 30).view,
            RandomView().make.circle(radius: 30).view,
            RandomView().make.square(side: 10).view
        ]
        let stackView1 = views.make.horizontalStackView()
        stackView1.place.below(canvas2, height: 30).with.sides()
        
        // Print constraint info about the stack view
        view2.debug.constraints()
    }

}

