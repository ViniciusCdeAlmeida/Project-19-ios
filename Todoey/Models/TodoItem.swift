//
//  TodoItens.swift
//  Todoey
//
//  Created by Apple Multiplier on 21/02/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

class TodoItem {
    let title: String
    var done: Bool

    init(title: String, done: Bool) {
        self.title = title
        self.done = done
    }

    convenience init(title: String) {
        self.init(title: title, done: false)
    }
}
