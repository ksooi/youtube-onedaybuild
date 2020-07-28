//
//  ViewController.swift
//  youtube-onedaybuild
//
//  Created by Ooi Kok Sing on 14/6/20.
//  Copyright © 2020 ECM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        model.getVideos()
    }


}

