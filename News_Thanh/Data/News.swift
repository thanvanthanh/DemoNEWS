//
//  News.swift
//  News_Thanh
//
//  Created by Thân Văn Thanh on 4/22/21.
//

import Foundation
import SwiftyJSON
import Alamofire
import Kingfisher


class News {
    var status: String?
    var totalResults: Int?
    var articless: [Articles]?
    
    
    required public init? (_ json: JSON){
        articless = json["articles"].arrayValue.map{ Articles($0)! }
        status = json["status"].stringValue
        totalResults = json["totalResults"].intValue
    }
    
}

class Articles {
    var image: String?
    var title : String?
    var publishedAt : String?
    var discription : String?
    var author : String?
    var source : Source?
    var url: String?

    
    required public init?(_ json: JSON){
        author = json["author"].stringValue
        image = json["urlToImage"].stringValue
        title = json["title"].stringValue
        publishedAt = json["publishedAt"].stringValue
        discription = json["description"].stringValue
        source = json["Source"].object as? Source
        url = json["url"].stringValue

    }
     
    
}
class Source {
    var id : String?
    var name: String?
    
    required public init?(_ json: JSON){
        id = json["id"].stringValue
        name = json["name"].stringValue
    }
}
