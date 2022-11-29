//
//  Artist.swift
//  utils_app
//
//  Created by aluno on 29/11/22.
//

import Foundation

class Artist {
    var name:String
    var age:Int
    var gender:String
    var musics:[String]
    
    init(name:String, age:Int, gender:String, musics:[String]) {
        self.name = name
        self.age = age
        self.gender = gender
        self.musics = musics
    }
}
