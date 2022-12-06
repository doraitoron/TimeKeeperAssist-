//
//  files.swift
//  TimeKeeperAssist Ⅱ
//
//  Created by clark on 2022/11/30.
//

import Foundation

struct files:Codable{
    var sn:String
    var d:[datas]
    init(sn: String, d: [datas]) {
            self.sn = sn
            self.d = d
        }
}

struct datas: Codable{
    var name:String!
    var time:Int!
    init(name: String, time: Int) {
            self.name = name
            self.time = time
        }
    
}
//MARK: フィrつたー作る
func load() -> [files] {
    let jsonDecoder = JSONDecoder()
    guard let dat = UserDefaults.standard.data(forKey: "key"),
          let file = try? jsonDecoder.decode([files].self, from: dat) else {
        return []
    }
        
    return file
}

//import Foundation
//
//protocol Storable {
//    func data(forKey: String) -> Data?
//    func set(_ data :Any?, forKey: String)
//}
//
//// テスト用スタブのため
//extension UserDefaults: Storable{}
//
////import Foundation
//
//struct files{
//    let sn:Storable
//    let d:Storable
//    init(sn: Storable = UserDefaults.standard, d: Storable = UserDefaults.standard) {
//            self.sn = sn
//            self.d = d
//        }
//    func save<T: Codable>(value: T, key: String) throws {
//        do {
//            let encodedData = try JSONEncoder().encode(value)
////            sn.set(encodedData, forKey: key)
//        } catch let error {
//            throw error
//        }
//    }
//
//    func load<T: Codable>(key: String) -> T? {
//        guard let data = sn.data(forKey: key) else { return nil }
//        do {
//            let decode = try JSONDecoder().decode(T.self, from: data)
//            return decode
//        } catch let error {
//            print(error.localizedDescription)
//            return nil
//        }
//    }
//}
//
//struct datas: Codable{
//    var name:String!
//    var time:Int!
//    init(name: String, time: Int) {
//            self.name = name
//            self.time = time
//        }
//}
//
//// 責務：データの永続化
//struct StoreManager {
//
//    let store: Storable
//
//    init(store: Storable = UserDefaults.standard) {
//        self.store = store
//    }
//
//    func save<T: Codable>(value: T, key: String) throws {
//        do {
//            let encodedData = try JSONEncoder().encode(value)
//            store.set(encodedData, forKey: key)
//        } catch let error {
//            throw error
//        }
//    }
//
//    func load<T: Codable>(key: String) -> T? {
//        guard let data = store.data(forKey: key) else { return nil }
//        do {
//            let decode = try JSONDecoder().decode(T.self, from: data)
//            return decode
//        } catch let error {
//            print(error.localizedDescription)
//            return nil
//        }
//    }
//}
