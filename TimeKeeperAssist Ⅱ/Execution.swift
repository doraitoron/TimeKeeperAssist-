//
//  PlayViewController.swift
//  TimeKeeperAssist Ⅱ
//
//  Created by clark on 2022/11/29.
//

import UIKit

class Execution: UIViewController,UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet var table: UITableView!
    
//    struct datas{
//        var name:String!
//        var time:Int!
//        init(name: String, time: Int) {
//                self.name = name
//                self.time = time
//            }
//    }

//    var file = [files]()
//    var data = [datas]()
    
    var data: [Any] = []
    var datas
    var saveData:UserDefaults=UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        table.delegate = self
        table.register(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! MainTableViewCell
        
        var h:Int
        var m:Int
        var s:Int
        
        h=data[indexPath.row].time/3600
        m=data[indexPath.row].time%3600/60
        s=data[indexPath.row].time%60
        
        var t:String = (String(h) + ":" + String(m) + ":" + String(s))
        
        cell.NameLabel?.text = data[indexPath.row].name
//        cell.TimeLabel?.text = String(data[indexPath.row].time)
        cell.TimeLabel?.text = String(t)
////       cell.animalImageView.image = UIImage(named: animals[indexPath.row].imageName)
//        print(data[indexPath.row])
        return cell
    }
    
}
