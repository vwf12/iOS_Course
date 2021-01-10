//
//  DatabaseManager.swift
//  ApiTest
//
//  Created by FARIT GATIATULLIN on 09.01.2021.
//

import Foundation
import RealmSwift

class DatabaseManager {
    private init() {}
    static let shared = DatabaseManager()

    private lazy var realm = try! Realm()

    // 1. Write
    func add(_ object: Object) {
        try! realm.write {
            self.realm.add(object, update: .all)
        }
    }

    // 2. Read
    func fetch<T: Object>() -> [T] {
        return Array(realm.objects(T.self))
    }

    // 3. Delete
    func delete(_ object: Object) {
        try! realm.write {
            self.realm.delete(object)
        }
    }
    
    // 4. Delete all
    
    func deleteAll() {
        try! realm.write {
            realm.deleteAll()
        }
    }

    func configure() {
        Realm.Configuration.defaultConfiguration.deleteRealmIfMigrationNeeded = true
    }
}
