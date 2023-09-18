//
//  Database Layer.swift
//  News App
//
//  Created by Nukte Ozkilinc on 18.09.2023.
//

import Foundation
import RxSwift

class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    var newsList = BehaviorSubject<[Articles]>(value: [Articles]())
    let db: FMDatabase?
    
    init() {
//        let filePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
//        let veritabaniURL = URL(fileURLWithPath: filePath).appendingPathComponent("news.sqlite")
//        db = FMDatabase(path: veritabaniURL.path)
        let databaseFilePath = Bundle.main.path(forResource: "news", ofType: "sqlite")!
        db = FMDatabase(path: databaseFilePath)
    }
    
    func saveNews(news: Articles) {
        db?.open()
        
        do {
            try db!.executeUpdate("INSERT INTO news (author,title,description,content,publishedAt,isLiked) VALUES (?,?)", values: [news.author!,news.title!,news.description!,news.content!,news.publishedAt!,news.isLiked!])
            
            print("SAVED \(news.author!)")
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func fetchSavedNews() {
        
        db?.open()
        var list = [Articles]()
        
        do {
            let result = try db!.executeQuery("SELECT * FROM news", values: nil)
            while result.next() {
                let news_id = Int(result.string(forColumn: "news_id"))!
                let author = result.string(forColumn: "author")
                let title = result.string(forColumn: "title")
                let description = result.string(forColumn: "description")
                let content = result.string(forColumn: "content")
                let publishedAt = result.string(forColumn: "publishedAt")
                let isLiked = Int(result.string(forColumn: "isLiked"))
                
                let news = Articles(news_id: news_id, author: author, title: title, description: description, publishedAt: publishedAt, content: content, isLiked: isLiked)
                list.append(news)
            }
            newsList.onNext(list)
            print(list)
        } catch {
            print(error.localizedDescription)
        }
    }
}
