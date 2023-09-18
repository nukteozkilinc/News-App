//
//  Articles.swift
//  News App
//
//  Created by Nukte Ozkilinc on 11.09.2023.
//

import Foundation

struct Articles: Codable{
    var author: String?
    var title: String?
    var description: String?
    var url: URL?
    var urlToImage: URL?
    var publishedAt: String?
    var content: String?
    var isLiked: Bool?
    var source: SourceModel?
}
