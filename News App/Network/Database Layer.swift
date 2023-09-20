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
    
    
    let context = appDelegate.persistentContainer.viewContext
    
    static let shared = DatabaseManager()
    
    func saveNews(author: String, content: String, description: String, publishedAt: String, title: String) {
        //let news = NewsModel(context: context)
        
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

//        NewsModel.fetchRequest().predicate = NSPredicate(format: "title == %@", news.title!)
//        let existingNews = try! context.fetch(NewsModel.fetchRequest())
//        if let newsToDelete = existingNews.first {
//            context.delete(newsToDelete)
//            appDelegate.saveContext()
//        }
        
//        do {
//               let fetchRequest : NSFetchRequest<Contact> = Contact.fetchRequest()
//               fetchRequest.predicate = NSPredicate(format: "uniqueId == %@", contactIdentifier)
//               let fetchedResults = try context.fetch(fetchRequest)
//               if let aContact = fetchedResults.first {
//                  providerName.text = aContact.providerName
//               }
//           }
    }
    
    func fetchSavedNews (completion: @escaping (Result<Articles, Error>) -> Void) -> Void {
        
        var newsList = [Articles]()
        
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
            print(newsList)
        } catch {
            print("Failed")
        }
    }
}
