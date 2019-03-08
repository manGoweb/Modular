//
//  ViewController.swift
//  Modular_MacOS
//
//  Created by Ondrej Rafaj on 03/12/2017.
//  Copyright © 2017 manGoweb UK. All rights reserved.
//

import Cocoa
import Modular


class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let canvas1 = NSBox()
        canvas1.title = "Modular test!"
        canvas1.place.on(view).with.top().bottom().and.sides()
        canvas1.debug.constraints()
    }

}

