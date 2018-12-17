//
//  student.swift
//  TabelView
//
//  Created by student on 2018/11/10.
//  Copyright © 2018年 yangmiao. All rights reserved.
//

import Foundation

class Student {
    var name:String
    var age:String
    var gender:String
    var grade:String
    var identity:String
    
    init(name:String, age:String, gender:String, grade:String) {
        self.name = name
        self.age = age
        self.gender = gender
        self.grade = grade
        self.identity = "Student"
    }
}
