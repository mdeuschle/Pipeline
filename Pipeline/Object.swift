//
//  Object.swift
//  Pipeline
//
//  Created by Matt Deuschle on 4/29/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

import Foundation
import Alamofire

class Object {

    var id = 0
    var imageURL = ""
    var imageThumb = ""
    var status = ""
    var descrip = ""
    var urlPipeline = "\(urlBase)"

    init() {

    }

    func downloadPipelineDetails(completed: DownloadComplete) {

        let url = NSURL(string: urlPipeline)!

        Alamofire.request(.GET, url).responseJSON { response in

            let result = response.result

            print(result.debugDescription)
        }
    }    
}



//
//"id": "1",
//"image_url": "http://winprd3.miticon.net/DEV1/HL/fs//fid1/fid1_logo.jpg",
//"image_thumb_url": "http://winprd3.miticon.net/DEV1/HL/fs//fid1/fid1_logo_WRKTMBJPG.jpg",
//"status_cd": "ACTIVE",
//"description": "",
