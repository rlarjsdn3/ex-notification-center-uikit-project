//
//  ApplicationData.swift
//  HelloSystemNotification
//
//  Created by 김건우 on 2/16/24.
//

import Foundation

struct ApplicationData {
    var names: [String] = []
    
    mutating func addNewName(newName: String) {
        names.append(newName)
        
        let center = NotificationCenter.default
        let name = Notification.Name("Update Data")
        let info = ["type": newName]
        center.post(name: name, object: nil, userInfo: info)
    }
}
var AppData = ApplicationData()
