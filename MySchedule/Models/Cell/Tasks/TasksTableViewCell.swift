//
//  TasksTableViewCell.swift
//  MySchedule
//
//  Created by Полищук Александр on 29.08.2022.
//

import UIKit

class TasksTableViewCell: UITableViewCell {

    let taskName = UILabel(text: "Программирование", font: .avenirNextDemiBold20(), alignment: .left)
    let taskDescription = UILabel(text: "Научиться писать extension и правильно их применять", font: .avenirNext14(), alignment: .left)
    
    static var readyButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "chevron.down.circle"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    weak var cellTaskDelegate: PressButtonTaskButtonProtocol?
    var index: IndexPath?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        setConstraints()
        
        TasksTableViewCell.readyButton.addTarget(self, action: #selector(readyButtonTapped), for: .touchUpInside)

        taskDescription.numberOfLines = 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func readyButtonTapped() {
        guard let index = index else { return }
        cellTaskDelegate?.readyButtonTapped(indexPath: index)
    }
    
    func configure(model: TasksModel) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        taskName.text = model.taskLessonName
        taskDescription.text = model.task
        backgroundColor = UIColor().colorFromHex("\(model.taskColor)")
    }
    
    func setConstraints() {
        self.contentView.addSubview(TasksTableViewCell.readyButton)
        NSLayoutConstraint.activate([
            TasksTableViewCell.readyButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            TasksTableViewCell.readyButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            TasksTableViewCell.readyButton.heightAnchor.constraint(equalToConstant: 40),
            TasksTableViewCell.readyButton.widthAnchor.constraint(equalToConstant: 40),
        ])
        
        self.addSubview(taskName)
        NSLayoutConstraint.activate([
            taskName.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            taskName.trailingAnchor.constraint(equalTo: TasksTableViewCell.readyButton.leadingAnchor, constant: -5),
            taskName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            taskName.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        self.addSubview(taskDescription)
        NSLayoutConstraint.activate([
            taskDescription.topAnchor.constraint(equalTo: taskName.bottomAnchor, constant: 5),
            taskDescription.trailingAnchor.constraint(equalTo: TasksTableViewCell.readyButton.leadingAnchor, constant: -5),
            taskDescription.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            taskDescription.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
        ])
    }
}
