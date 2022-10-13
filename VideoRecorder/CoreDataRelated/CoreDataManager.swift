//
//  CoreDataManager.swift
//  VideoRecorder
//
//  Created by pablo.jee on 2022/10/13.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    private init() { }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    var isFetching: Bool = false
    var coreList = [VideoEntity]()
    
    var context: NSManagedObjectContext {
        return self.persistentContainer.viewContext
    }
    
    func fetchSave() {
        if isFetching {
            print("isFetching...")
            return
        }
        isFetching = true
        let request: NSFetchRequest<VideoEntity> = VideoEntity.fetchRequest()
        request.fetchLimit = 6
        request.fetchOffset = coreList.count
        // 날짜 내림차순 sort
        let sortByDateDesc = NSSortDescriptor(key: "date", ascending: false)
        request.sortDescriptors = [sortByDateDesc]
        do {  //데이터 호출
            coreList.append(contentsOf: try context.fetch(request))
            print("Fetched!")
            isFetching = false
        } catch {
            print(error)
            isFetching = false
        }
    }
    
    func fetchData() -> [VideoModel] {
        let request = VideoEntity.fetchRequest()
        
        let result = (try? self.context.fetch(request)) ?? []
        let model = result.map { VideoModel(videoEntity: $0) }
        return model
    }
    
    func saveData(_ model: VideoModel) {
        guard let entity = NSEntityDescription.entity(forEntityName: "VideoEntity", in: self.context) else { return }
        let video = VideoEntity(entity: entity, insertInto: self.context)
        video.imageURL = model.imageURL
        video.id = model.id
        video.videoFileURL = model.videoFileURL
        video.date = model.date
        video.duration = model.duration
        video.name = model.name
        // TODO: error handling
        try? self.context.save()
    }
    
    func addSave(_ name: String?, time: Float?) {
        let newVideo = VideoEntity(context: context)
        
        newVideo.name = name
        coreList.insert(newVideo, at: 0)
        saveContext()
    }
    
    // TODO: error handling
    func removeData(_ model: VideoModel) {
        let request = VideoEntity.fetchRequest()
        
        let result = (try? self.context.fetch(request)) ?? []
        guard let video = result.first(where: { $0.id == model.id }) else {
            return
        }
        self.context.delete(video)
        try? self.context.save()
    }
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
