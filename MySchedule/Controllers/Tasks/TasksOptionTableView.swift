//
//  TaskOptionTableView.swift
//  MySchedule
//
//  Created by Полищук Александр on 30.08.2022.
//

import UIKit

class TasksOptionTableView: UITableViewController {
    
    private let idOptionsTaskCell = "idOptionsTaskCell"
    private let idOptionsTasksCellHeader = "idOptionsTasksCellHeader"
    
    var tasksModel = TasksModel()
    var editModel = false
    var hexColorCell = "5D11F7"
    var date: Date?
    let headerNameArray = ["DATE","SUBJECT","TASK","COLOR"]
    
    var cellNameArray = ["Date","Lesson","Task",""]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = .white
        title = "Options Tasks"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = #colorLiteral(red: 0.9594197869, green: 0.9599153399, blue: 0.975127399, alpha: 1)
        tableView.separatorStyle = .none
        tableView.register(OptionsTableViewCell.self, forCellReuseIdentifier: idOptionsTaskCell)
        tableView.bounces = false
        tableView.register(HeaderOptionsTableViewCell.self, forHeaderFooterViewReuseIdentifier: idOptionsTasksCellHeader)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonTapped))
    }
    
    private func setModel() {
        tasksModel.taskDate = date
        tasksModel.taskLessonName = cellNameArray[1]
        tasksModel.task = cellNameArray[2]
        tasksModel.taskColor = ""
        tasksModel.taskIsFinished = false
    }
    
    @objc private func saveButtonTapped() {
        
        if tasksModel.taskDate == nil || tasksModel.taskLessonName == "Unknown" || tasksModel.task == "Unknown" {
            alertOk(title: "Error", message: "Required fields: DATE, TIME, NAME")
        } else if editModel == false {
            setModel()
            tasksModel.taskColor = hexColorCell
            RealmManager.shared.saveTasksModel(model: tasksModel)
            tasksModel = TasksModel()
            alertOk(title: "Task added", message: nil)
            hexColorCell = "5D11F7"
            tableView.reloadData()
        } else {
            setModel()
            tasksModel = TasksModel()
            RealmManager.shared.updateTasksModel(model: tasksModel, nameArray: cellNameArray, date: date)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsTaskCell, for: indexPath) as! OptionsTableViewCell
        cell.cellTaskConfigure(nameArray: cellNameArray, indexPath: indexPath, hexColor: hexColorCell)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: idOptionsTasksCellHeader) as! HeaderOptionsTableViewCell
        header.headerConfigure(nameArray: headerNameArray, section: section)
        return header
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! OptionsTableViewCell
        
        switch indexPath.section {
        case 0: alertDate(label: cell.nameCellLabel) { (_, date) in
//            self.tasksModel.taskDate = date
            let dateFormatter = DateFormatter()
            self.cellNameArray[0] = dateFormatter.string(from: date)
        }
        case 1: alertForCellName(label: cell.nameCellLabel, name: "Name Lesson", placeholder: "Enter lesson name") { text in
//            self.tasksModel.taskLessonName = text
            self.cellNameArray[1] = text
        }
        case 2: alertForCellName(label: cell.nameCellLabel, name: "Name Task", placeholder: "Enter task name") { text in
//            self.tasksModel.task = text
            self.cellNameArray[2] = text
        }
        case 3: pushControllers(vc: TaskColorsTableViewController())
        default: print("Tap OptionTableView")
        }
    }
    
    func pushControllers(vc: UIViewController) {
        let viewController = vc
        navigationController?.navigationBar.topItem?.title = "Options"
        navigationController?.pushViewController(viewController, animated: true)
    }
}

