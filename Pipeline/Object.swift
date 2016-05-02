//
//  Object.swift
//  Pipeline
//
//  Created by Matt Deuschle on 4/29/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Object {

    var id: String!
    var imageURL: String!
    var imageThumb: String!
    var status: String!
    var descrip: String!
    var urlPipeline = "\(urlBase)"

    init() {

    }

    func downloadPipelineDetails(completed: DownloadComplete) {

        let url = NSURL(string: urlPipeline)!

        Alamofire.request(.GET, url).responseJSON { response in

            if let result = response.result.value {

                let json = JSON(result)

                for i in 1...20 {

                    let sourceId = json["\(i)"].dictionaryValue

                if let id = sourceId["id"]?.stringValue {

                    self.id = id
                }

                if let imageURL = sourceId["image_url"]?.stringValue {

                    self.imageURL = imageURL
                }

                if let imageThumb = sourceId["image_thumb_url"]?.stringValue {

                    self.imageThumb = imageThumb
                }

                if let status = sourceId["status_cd"]?.stringValue {

                    self.status = status
                }

                if let descrip = sourceId["description"]?.stringValue {

                    self.descrip = descrip
                }

                print("ID \(self.id)")
                print("Image \(self.imageURL)")
                print("Thumb \(self.imageThumb)")
                print("Status \(self.status)")
                print("Descrip \(self.descrip)")
            }
            
        }
    }
}    
}




//
//"id": "1",
//"image_url": "http://winprd3.miticon.net/DEV1/HL/fs//fid1/fid1_logo.jpg",
//"image_thumb_url": "http://winprd3.miticon.net/DEV1/HL/fs//fid1/fid1_logo_WRKTMBJPG.jpg",
//"status_cd": "ACTIVE",
//"description": "",
