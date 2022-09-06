//
//  RealmManager.swift
//  MySchedule
//
//  Created by Полищук Александр on 31.08.2022.
//

import RealmSwift
import SwiftUI


class RealmManager {
    static let shared = RealmManager()
    
    private init() {}
    
    let localRealm = try! Realm()
    
    func saveScheduleModel(model: ScheduleModel) {
        try! localRealm.write {
            localRealm.add(model)
        }
    }
    
    func deleteScheduleModel(model: ScheduleModel) {
        try! localRealm.write {
            localRealm.delete(model)
        }
    }
    
    func saveTasksModel(model: TasksModel) {
        try! localRealm.write {
            localRealm.add(model)
        }
    }
    
    func deleteTasksModel(model: TasksModel) {
        try! localRealm.write {
            localRealm.delete(model)
        }
    }
    
    func updateReadyButtonTaskModel(task: TasksModel, bool: Bool) {
        try! localRealm.write {
            task.taskIsFinished = bool
        }
    }
    
    func saveContactModel(model: ContactModel) {
        try! localRealm.write {
            localRealm.add(model)
        }
    }
    
    func deleteContactModel(model: ContactModel) {
        try! localRealm.write {
            localRealm.delete(model)
        }
    }
   
    func updateContactModel(model: ContactModel, nameArray: [String], imageData: Data?) {
        try! localRealm.write {
            model.contactsName = nameArray[0]
            model.contactsPhone = nameArray[1]
            model.contactsMail = nameArray[2]
            model.contactsType = nameArray[3]
            model.contactsImage = imageData
            localRealm.add(model)
        }
    }
}
