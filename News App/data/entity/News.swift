//
//  News.swift
//  News App
//
//  Created by Nukte Ozkilinc on 11.09.2023.
//

import Foundation

struct News: Codable{
    var status: String?
    var totalResults: Int?
    var articles: [Articles]?
}
