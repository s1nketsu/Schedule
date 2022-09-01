//
//  RealmManager.swift
//  MySchedule
//
//  Created by Полищук Александр on 31.08.2022.
//

import RealmSwift


class RealmManager {
    static let shared = RealmManager()
    
    private init() {}
    
    let localRealm = try! Realm()
    
    func saveScheduleModel(model: ScheduleModel) {
        try! localRealm.write {
            localRealm.add(model)
        }
    }
}
