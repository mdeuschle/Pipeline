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

            let result = response.result

            if let dic = result.value?.objectForKey("1") as? [String: AnyObject] {

                if let id = dic["id"] as? String {

                    self.id = id
                }

                if let imageURL = dic["image_url"] as? String {

                    self.imageURL = imageURL
                }

                if let imageThumb = dic["image_thumb_url"] as? String {

                    self.imageThumb = imageThumb
                }

                if let status = dic["status_cd"] as? String {

                    self.status = status
                }

                if let descrip = dic["description"] as? String {

                    self.descrip = descrip
                }

                print(self.id)
                print(self.imageURL)
                print(self.imageThumb)
                print(self.status)
                print(self.descrip)
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
