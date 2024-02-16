//
//  ViewController.swift
//  HelloSystemNotification
//
//  Created by 김건우 on 2/16/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counter: UILabel!
    var myTask: Task<(), Never>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTask = Task(priority: .background) {
            await readNotifications()
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        myTask?.cancel()
    }
    
    func readNotifications() async {
        let center = NotificationCenter.default
        let name = Notification.Name("Update Data")
        
        // ⭐️ Notification이 포스트되면 비동기적으로 처리되기 때문에 for-await-in 키워드를 사용함
        // (단, 일반적인 Notification은 노티피케이션이 포스트된 쓰레드에서 처리됨)
        for await notification in center.notifications(named: name, object: nil) {
            if let info = notification.userInfo {
                let type = info["type"] as? String
                if type == "John" {
                    print("Our name was inserted")
                }
            }
            
            let current = AppData.names
            await MainActor.run {
                self.counter.text = String(current.count)
            }
        }
    }


}

