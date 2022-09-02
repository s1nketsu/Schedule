//
//  TasksModel.swift
//  MySchedule
//
//  Created by Полищук Александр on 02.09.2022.
//

import RealmSwift
import Foundation

class TasksModel: Object {
    
    @Persisted var taskDate: Date?
    @Persisted var taskLessonName: String = "Unknown"
    @Persisted var task: String = "No task added"
    @Persisted var taskColor: String = "5D11F7"
    @Persisted var taskIsFinished: Bool = false
    @Persisted var taskWeekday: Int = 1
}
