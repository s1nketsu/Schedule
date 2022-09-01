//
//  ScheduleColorViewController.swift
//  MySchedule
//
//  Created by Полищук Александр on 30.08.2022.
//

import UIKit

class ScheduleColorsViewController: UITableViewController {
    
    private let idOptionsColorCell = "idOptionsColorCell"
    private let idOptionsScheduleHeader = "idOptionsScheduleHeader"
    
    let headerNameArray = ["RED","ORANGE","YELLOW","GREEN","BLUE","DEEP BLUE","VIOLET"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = .white
        title = "Colors Schedule"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = #colorLiteral(red: 0.9594197869, green: 0.9599153399, blue: 0.975127399, alpha: 1)
        tableView.separatorStyle = .none
        tableView.register(ColorsTableViewCell.self, forCellReuseIdentifier: idOptionsColorCell)
        tableView.bounces = false
        tableView.register(HeaderOptionsTableViewCell.self, forHeaderFooterViewReuseIdentifier: idOptionsScheduleHeader)

    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsColorCell, for: indexPath) as! ColorsTableViewCell
        cell.cellConfigure(indexPath: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: idOptionsScheduleHeader) as! HeaderOptionsTableViewCell
        header.headerConfigure(nameArray: headerNameArray, section: section)
        return header
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.section {
        case 0: setColor(color: "BE2813")
        case 1: setColor(color: "EF5931")
        case 2: setColor(color: "F3AF22")
        case 3: setColor(color: "579F2B")
        case 4: setColor(color: "3DACF7")
        case 5: setColor(color: "5D11F7")
        case 6: setColor(color: "8E5AF7")
        default:
            setColor(color: "FFFFFF")
        }
    }
    
    private func setColor(color: String) {
        let scheduleOptions = self.navigationController?.viewControllers[1] as? ScheduleOptionsTableViewController
        scheduleOptions?.hexColorCell = color
        scheduleOptions?.tableView.reloadRows(at: [[3,0],[4,0]], with: .none)
        self.navigationController?.popViewController(animated: true)
    }
}
