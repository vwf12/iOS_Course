//
//  RequestHadler.swift
//  ApiTest
//
//  Created by FARIT GATIATULLIN on 26.12.2020.
//

import Foundation
import Alamofire
import SwiftyJSON

struct RequestHandler {
    
    private var tableData:NSArray = []
    private let hostUrl = "https://swapi.dev/api/"
    private let path: String
    private var headers: HTTPHeaders = [:]

    private var completeUrl: String {
        return hostUrl + path
    }

    init(path: String) {
        self.path = path
    }

//    func addHeader(name: String, value: String) -> RequestHandler {
//        var new = self
//        new.headers[name] = value
//        return new
//    }

//    private func fetchHeaders() -> HTTPHeaders {
//        return [
//            "x-rapidapi-key": "c54234135amsh51904404083e71cp19ac65jsn6fc7b6f5c228",
//            "x-rapidapi-host": "weatherbit-v1-mashape.p.rapidapi.com",
//            "useQueryString": "true"
//        ]
//    }

    @discardableResult
    func responseJSON(_ closure: ((JSON) -> Void)?) -> RequestHandler {

        AF.request(completeUrl, method: .get)
            .responseData { (response) in
                if let data = response.data {
                    let json = (try? JSON(data: data)) ?? JSON()
                    let nextPage = json["next"]
                    print(nextPage)
                    closure?(json)
                } else {
                    closure?(JSON())
                }
            }
        return self
    }

    @discardableResult
    func response<T: Codable>(_ closure: ((T?) -> Void)?) -> RequestHandler {
        responseJSON { (json) in
            let finalJSON = json["results"]
            closure?(T.from(finalJSON))
        }
    }
    
    ///////// TEST!


//        func loadSomeJSONDataFromPagedEndPoint(page: Int) {
//            AF.request("http://swapi.dev/api/people/?page=\(page)", method: .get)
//            request.responseJSON { [weak self] _, _, jsonData, _ in
//                if let strongSelf = self {
//                    let json = JSON(jsonData!)
//
//                    let totalPages = json["totalPages"].stringValue.toInt()!
//                    let currentPage = json["currentPage"].stringValue.toInt()!
//
//                    let results = json["results"].arrayObject!
//                    strongSelf.pagedResults += results
//
//                    if currentPage < totalPages {
//                        strongSelf.loadSomeJSONDataFromPagedEndPoint(currentPage + 1)
//                    } else {
//                        strongSelf.parsePagedResults()
//                    }
//                }
//            }
//        }
//
//        func parsePagedResults() {
//            let json = JSON(pagedResults)
//            print(json)
//        }
    var pagedResults = [AnyObject]()
    @discardableResult
    mutating func responseJSONMy(_ closure: ((JSON) -> Void)?) -> RequestHandler {

        AF.request(completeUrl, method: .get)
            .responseData { (response) in
                if let data = response.data {
                    let json = (try? JSON(data: data)) ?? JSON()
                    var currentPage = 1
                    let nextPage = json["next"]
                    print(nextPage)
                    var results = json["results"].arrayObject!
                    pagedResults.append(results)
                    closure?(json)
                } else {
                    closure?(JSON())
                }
            }
        return self
    }

    
}

