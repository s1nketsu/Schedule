//
//  ScheduleModel.swift
//  MySchedule
//
//  Created by Полищук Александр on 31.08.2022.
//

import UIKit
import RealmSwift

class ScheduleModel: Object {
    
    @Persisted var scheduleDate = Date()
    @Persisted var scheduleTime = Date()
    @Persisted var scheduleName: String = ""
    @Persisted var scheduleType: String = ""
    @Persisted var scheduleBuilding: String = ""
    @Persisted var scheduleAudience: String = ""
    @Persisted var scheduleTeacher: String = "Name Lastname"
    @Persisted var scheduleColor: String = "5D11F7"
    @Persisted var scheduleRepeat: Bool = true
    @Persisted var scheduleWeekday: Int = 1
}
