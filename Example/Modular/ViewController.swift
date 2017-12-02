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
        
        let canvas = RandomView()
        canvas.place.on(andFill: view)
        
        let view1 = RandomView()
        view1.place.on(canvas, height: 44).edgeToEdge()
        
        let label1 = RandomLabel()
        label1.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut eu viverra orci. Morbi nulla diam, ornare sit amet bibendum aliquet, lacinia et purus. Ut lacinia bibendum dapibus.\n\nNunc luctus turpis id lectus iaculis, at congue dolor lobortis. Nulla ac mollis nisi. Etiam mollis varius faucibus.\n\nEtiam arcu leo, hendrerit a est tempus, pellentesque convallis elit. Donec finibus enim eu leo venenatis feugiat vitae id est. Curabitur facilisis tincidunt dui sit amet faucibus. Donec maximus dolor vitae ex pellentesque, ac laoreet lectus placerat."
        label1.place.below(view1).with.sideMargins()
        
        let view2 = RandomView()
        view2.place.below(label1).make.square(height: 80).add.leftMargin()
        
        let circle1 = RandomView()
        circle1.place.next(to: view2).make.circle(radius: 120)
        
        let view3 = RandomView()
        view3.place.below([view2, circle1], height: 40).with.sideMargins()
    }

}

