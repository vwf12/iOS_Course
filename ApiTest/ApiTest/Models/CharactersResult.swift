//
//  CharactersResult.swift
//  ApiTest
//
//  Created by FARIT GATIATULLIN on 26.12.2020.
//

import Foundation

struct CharacterResult: Codable {
    var idLocal: String?
    var name: String?
    //private(set) var age: Int?
    
    init(realmModel: UserRealmModel) {
        self.idLocal = realmModel.idLocal
        self.name = realmModel.name
        //self.age = realmModel.age
    }
}
