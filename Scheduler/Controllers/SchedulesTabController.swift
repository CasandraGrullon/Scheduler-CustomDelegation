//
//  SchedulesTabController.swift
//  Scheduler
//
//  Created by casandra grullon on 1/24/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

class SchedulesTabController: UITabBarController {

    private let dataPersistence = DataPersistence<Event> (filename: "schedules.plist")
    
    //get instances of the two tabs ( a,b )
    //a
    //1a. access the UINavigationController
    //2a. access the first view controller
    private lazy var schedulesNavController: UINavigationController = {
        guard let navController = storyboard?.instantiateViewController(identifier: "SchedulesNavController") as? UINavigationController,
            let scheulesListController = navController.viewControllers.first as? ScheduleListController else {
            fatalError("could not load schedule nav controller")
        }
        //3a. set data persistence property
        scheulesListController.dataPersistence = dataPersistence
        
        return navController
    }()
    //b
    //1b. access the UINavigationController
    //2b. access the first view controller
    private lazy var completedNavController: UINavigationController = {
        guard let navController = storyboard?.instantiateViewController(identifier: "CompletedNavController") as? UINavigationController,
            let completedController = navController.viewControllers.first as? CompletedScheduleController else {
                fatalError("could not load completed nav controller")
        }
        //3b. set data persistence property
        completedController.dataPersistence = dataPersistence
        //Custom Delegation: 4. set delegate object
        completedController.dataPersistence.delegate = completedController
        return navController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [schedulesNavController, completedNavController]

    }
    


}
