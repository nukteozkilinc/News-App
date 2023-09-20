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
    
    let context = appDelegate.persistentContainer.viewContext
    
    static let shared = DatabaseManager()
    
    func saveNews(author: String, content: String, description: String, publishedAt: String, title: String) {
      
        let entity = NSEntityDescription.entity(forEntityName: "NewsModel", in: context)
        let news = NSManagedObject(entity: entity!, insertInto: context)
        
        news.setValue(author, forKey: "author")
        news.setValue(content, forKey: "content")
        news.setValue(title, forKey: "title")
        news.setValue(publishedAt, forKey: "publishedAt")
        news.setValue(true, forKey: "isLiked")
        news.setValue(description, forKey: "descrip")
        
        appDelegate.saveContext()
    }
    
    func deleteNews(news: Articles) {
        
        do {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "NewsModel")
            request.predicate = NSPredicate(format: "title == %@", news.title!)
            let fetchResult = try context.fetch(request)
            
            for data in fetchResult as! [NSManagedObject]{
                context.delete(data)
                appDelegate.saveContext()
            }
            appDelegate.saveContext()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func fetchSavedNews (completion: @escaping (Result<[Articles], Error>) -> Void) -> Void {
        
        var newsList = [Articles]()
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "NewsModel")
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
                newsList.append(news)
                completion(.success(newsList))
            }
        } catch {
            print("Failed")
        }
    }
}
