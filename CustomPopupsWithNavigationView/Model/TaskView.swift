//
//  TaskView.swift
//  CustomPopupsWithNavigationView
//
//  Created by nakamura motoki on 2022/02/09.
//

import SwiftUI

// MARK: Task Model
struct Task: Identifiable{
    var id = UUID().uuidString
    var taskTitle: String
    var taskDexcription: String
}

// MARK: Smaple Tasks
// Task構造体を配列でまとめる
var tasks: [Task] = [
    Task(taskTitle: "Meeting", taskDexcription: "Discues team ask for the day"),
    Task(taskTitle: "Icon set", taskDexcription: "Edit icons for team task for next week"),
    Task(taskTitle: "Meeting", taskDexcription: "Discues team ask for the day"),
    Task(taskTitle: "Meeting", taskDexcription: "Discues team ask for the day"),
    Task(taskTitle: "Meeting", taskDexcription: "Discues team ask for the day"),
    Task(taskTitle: "Meeting", taskDexcription: "Discues team ask for the day"),
    Task(taskTitle: "Meeting", taskDexcription: "Discues team ask for the day"),
    Task(taskTitle: "Meeting", taskDexcription: "Discues team ask for the day"),
    Task(taskTitle: "Meeting", taskDexcription: "Discues team ask for the day"),
]
