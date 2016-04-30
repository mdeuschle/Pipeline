//
//  DetailViewController.swift
//  Pipeline
//
//  Created by Matt Deuschle on 4/29/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var object = Object()

    override func viewDidLoad() {
        super.viewDidLoad()

        object.downloadPipelineDetails { () -> () in
        }

    }

}
