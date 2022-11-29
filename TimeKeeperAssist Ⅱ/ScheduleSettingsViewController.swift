//
//  ScheduleSettingsViewController.swift
//  TimeKeeperAssist Ⅱ
//
//  Created by clark on 2022/10/20.
//



//MARK: - Class 配列　メンターボックス　tableviewが亡くなった

import UIKit

extension UITextField /*,UITextFieldDelegate */{
    var textToInt: Int {
        let text = self.text
        let int = text
            .flatMap{Int($0)} ?? 0
        return int
    }
}

class ScheduleSettingsViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var ScheduleName: UITextField!
    @IBOutlet var Names: UITextField!
    @IBOutlet var Hs: UITextField!
    @IBOutlet var Ms: UITextField!
    @IBOutlet var Ss: UITextField!
    @IBOutlet var table: UITableView!
//    @IBOutlet var cell: UITableViewCell!
//    @IBOutlet var cellLabel1: UILabel!
//    @IBOutlet var cellLabel2: UILabel!
    @IBOutlet var p: UIButton!
    @IBOutlet var s: UIButton!
    @IBOutlet var e: UIButton!
    
    var H : Int!
    var M : Int!
    var S : Int!
    
    var T : Int!
    
    struct files{
        var sn:String
        var d:[Any]
        init(sn: String, d: [Any]) {
                self.sn = sn
                self.d = d
            }
    }
    
    struct datas{
        var name:String!
        var time:Int!
        init(name: String, time: Int) {
                self.name = name
                self.time = time
            }
    }

    var file = [files]()
    var data = [datas]()
    
    var saveData:UserDefaults=UserDefaults.standard
    

    override func viewDidLoad() {
        
//        tableView.backgroundColor = UIColor.yellow;
        
        
        
        self.Hs.keyboardType = UIKeyboardType.numberPad;
        self.Ms.keyboardType = UIKeyboardType.numberPad;
        self.Ss.keyboardType = UIKeyboardType.numberPad;
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        table.dataSource = self
        table.delegate = self
        table.register(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")

    }
    
    @IBAction func plus(){
        
        H = Hs.textToInt
        M = Ms.textToInt
        S = Ss.textToInt
        T = H*3600+M*60+S
        
//        let name = self.data()["name"] as! String
        
        
        data.append(datas(name: Names.text!, time: T))
        
        self.table.reloadData()
        
//        let addData:[Int:Any] = [
//            data.count:Hs.text,
//        ]
//        saveData.data.addDocument(datas:addData)
        
        
    }
    
    @IBAction func save(){
        file.append(files(sn: ScheduleName.text!, d: data))
        saveData.set(file, forKey: "key")
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
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = data[indexPath.row]
//        cell.detailTextLabel?.text = data[indexPath.row]
//        return cell
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        //let cell = myTableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath)
        
        print(data)
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! MainTableViewCell
//        self.table.reloadData()
//        print("OK")
//        print(data.count)
//
////        guard let cell = table.dequeueReusableCell(withIdentifier: "SScell", for: indexPath) as? SScellTableViewCell else {
////            fatalError("Dequeue failed: SScell.")
////        }
//
////        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "SScell", for: indexPath)
//
        var h:Int
        var m:Int
        var s:Int
        
        h=data[indexPath.row].time/3600
        m=data[indexPath.row].time%3600/60
        s=data[indexPath.row].time%60
        
        
        
//       MARK: -エラー
        
//        var t:String = (h + m + s)
        var t:String = (String(h) + ":" + String(m) + ":" + String(s))
        
        cell.NameLabel?.text = data[indexPath.row].name
//        cell.TimeLabel?.text = String(data[indexPath.row].time)
        cell.TimeLabel?.text = String(t)
////       cell.animalImageView.image = UIImage(named: animals[indexPath.row].imageName)
//        print(data[indexPath.row])
        return cell
    }
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath){
//        cell.backgroundColor = UIColor.yellow
//    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPlay" {
            let nextView = segue.destination as! Execution
            nextView.data = data
            nextView.datas = datas
        }
    }
}
//self.table.reloadData()
//print("OK")
//print(data.count)
//
////        guard let cell = table.dequeueReusableCell(withIdentifier: "SScell", for: indexPath) as? SScellTableViewCell else {
////            fatalError("Dequeue failed: SScell.")
////        }
//
////        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "SScell", for: indexPath)
//
//cell.NameLabel?.text = data[indexPath.row].name
//cell.TimeLabel?.text = String(data[indexPath.row].time)
////       cell.animalImageView.image = UIImage(named: animals[indexPath.row].imageName)
//print(data[indexPath.row])
