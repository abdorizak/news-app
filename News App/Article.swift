//
//  Article.swift
//  News App
//
//  Created by Abdirizak Hassan on 9/17/21.
//

import Foundation

struct Article: Decodable {
    let headline: String
    let urlToImage: String?
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case headline = "title", urlToImage, url
    }
}
