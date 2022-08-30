//
//  ViewController.swift
//  MySchedule
//
//  Created by Полищук Александр on 27.08.2022.
//

import UIKit

class MainTapBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTapBar()
    }
    
    func setupTapBar() {
        
        let scheduleViewController = createNavController(vc: ScheduleViewController(), itemName: "Schedule", ItemImage: "calendar.badge.clock")
        let tasksViewController = createNavController(vc: TasksViewController(), itemName: "Tasks", ItemImage: "text.badge.checkmark")
        let contactsViewController = createNavController(vc: ContactsTableViewController(), itemName: "Contacts", ItemImage: "rectangle.stack.person.crop")
        
        viewControllers = [scheduleViewController, tasksViewController, contactsViewController]
        
    }

    func createNavController(vc: UIViewController, itemName: String, ItemImage: String) -> UINavigationController {
        
        let item = UITabBarItem(title: itemName, image: UIImage(systemName: ItemImage)?.withAlignmentRectInsets(.init(top: 10, left: 0, bottom: 0, right: 0)), tag: 0)
        
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem = item
        
        return navController
    }

}

