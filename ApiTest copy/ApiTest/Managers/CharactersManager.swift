//
//  CharactersManager.swift
//  ApiTest
//
//  Created by FARIT GATIATULLIN on 26.12.2020.
//

import Foundation

//var allCharacters:[CharacterResult?]? = []

var characters = [CharacterResult]()

class CharactersManager {
    static let shared = CharactersManager()
    
    private init() {}
    
    func fetchCharacter(closure: ((CharacterResult?) -> Void)?) {
        RequestHandler(path: "users")
            .response { (model: [CharacterResult]?) in
                print("Model fetched: \(model)")
                //closure?(model?)
                //allCharacters!.append(contentsOf: model!)
            }
            .responseJSON { (json) in
                print("JSON fetched: \(json)")
            }
    }

    func fetchAllCharacters(closure: (([CharacterResult]?) -> Void)?) {
        
        RequestHandler(path: "users").response(closure)
         
    }
    
//    func fetchAbsolutelyAllCharacters(closure: (([CharacterResult]?) -> Void)?) {
//        for i in 1...8 {
//        RequestHandler(path: "people/?page=\(i)").response(closure)
//           
//        }
//        
////        Test
//        
//        
//        
//    }
}
