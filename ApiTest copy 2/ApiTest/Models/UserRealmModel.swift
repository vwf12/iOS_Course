//
//  UserRealmModel.swift
//  ApiTest
//
//  Created by FARIT GATIATULLIN on 09.01.2021.
//

import RealmSwift

class UserRealmModel: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var age: Int = 0

    

    @objc open override class func primaryKey() -> String? {
        return "id"
    }
}

