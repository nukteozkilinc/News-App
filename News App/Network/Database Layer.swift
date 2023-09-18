//
//  Database Layer.swift
//  News App
//
//  Created by Nukte Ozkilinc on 18.09.2023.
//

import Foundation
import RxSwift
import CoreData

class DatabaseManager {
    
   // var newsList = BehaviorSubject<[NewsModel]>(value: [NewsModel]())
    var newsList = [Articles]()
    
    let context = appDelegate.persistentContainer.viewContext
    
    static let shared = DatabaseManager()
    
    func saveNews(author: String, content: String, description: String, isLiked: Bool, publishedAt: String, title: String) {
        //let news = NewsModel(context: context)
        
        let entity = NSEntityDescription.entity(forEntityName: "NewsModel", in: context)
        let news = NSManagedObject(entity: entity!, insertInto: context)
        
        news.setValue(author, forKey: "author")
        news.setValue(content, forKey: "content")
        news.setValue(title, forKey: "title")
        news.setValue(publishedAt, forKey: "publishedAt")
        news.setValue(isLiked, forKey: "isLiked")
        news.setValue(description, forKey: "descrip")
        
        appDelegate.saveContext()
    }
    
    func deleteNews(news: NewsModel) {
        
    }
    
    func fetchSavedNews (completion: @escaping (Result<Articles, Error>) -> Void) -> Void {
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "NewsModel")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                let news = Articles(
                    author: (data.value(forKey: "author") as! String),
                    title: (data.value(forKey: "title") as! String),
                    description: (data.value(forKey: "descrip") as! String),
                    publishedAt: (data.value(forKey: "publishedAt") as! String),
                    content: (data.value(forKey: "content") as! String),
                    isLiked: (data.value(forKey: "isLiked") as! Bool)
                )
                completion(.success(news))
                newsList.append(news)
            }
        } catch {
            
            print("Failed")
        }
    }
}
