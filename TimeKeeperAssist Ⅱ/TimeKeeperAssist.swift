//
//  TimeKeeperAssist.swift
//  TimeKeeperAssist Ⅱ
//
//  Created by clark on 2022/11/30.
//

import UIKit

//MARK: これTableViewだった。
class TimeKeeperAssist: UITableViewController  {
    
    let userDefaults = UserDefaults.standard

    func load() -> [files] {
        let jsonDecoder = JSONDecoder()
        guard let dat = UserDefaults.standard.data(forKey: "key"),
              let file = try? jsonDecoder.decode([files].self, from: dat) else {
            return []
        }
            
        return file
    }
    
    var file = [files]()// = load()
    
//    override func viewWillAppear(_ animated: Bool) {
//            super.viewWillAppear(animated)
//
//            tableView.reloadData()
//        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        file = load()
        

        // Do any additional setup after loading the view.
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("cell数"+String(file.count))
        return file.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "hc", for: indexPath) //as! MainTableViewCell
        cell.textLabel?.text = file[indexPath.row].sn
        print("OK")
        print(file)
        return cell
    }
    
    //    MARK: セーブのための
    @IBAction func unwindToMemoList(sender:UIStoryboardSegue){
        guard let sourceVC=sender.source as? ScheduleSettingsViewController,
              let filedes = sourceVC.file else{
            return
        }
//        let target = sourceVC.target else{
//            return
//        }
        if let selectedIndexPath = self.tableView.indexPathForSelectedRow {
            self.file[selectedIndexPath.row] = filedes
        } else {
        self.memos.append(memo)
        }
        self.userDefaults.set(self.memos, forKey: "memos")
//        self.tableView.reloadData()
        
//        guard let sourceVC=sender.source as? MemoViewController,
//        let target = sourceVC.target else{
//            return
//        }
//        if let selectedIndexPath = self.tableView.indexPathForSelectedRow {
//            self.targets[selectedIndexPath.row] = target
//        } else {
//        self.targets.append(target)
//        }
//        self.userDefaults.set(self.targets, forKey: "targets")
//
//
//        guard let sourceVC=sender.source as? MemoViewController,
//        let goal = sourceVC.goal else{
//            return
//        }
//        if let selectedIndexPath = self.tableView.indexPathForSelectedRow {
//            self.goals[selectedIndexPath.row] = goal
//        } else {
//        self.goals.append(goal)
//        }
//        self.userDefaults.set(self.goals, forKey: "goals")
//
//    //    self.tableView.reloadData()
//
//
//    guard let sourceVC=sender.source as? MemoViewController,
//    let way = sourceVC.way else{
//        return
//    }
//    if let selectedIndexPath = self.tableView.indexPathForSelectedRow {
//        self.ways[selectedIndexPath.row] = way
//    } else {
//    self.ways.append(way)
//    }
//    self.userDefaults.set(self.ways, forKey: "ways")
//
//        guard let sourceVC=sender.source as? MemoViewController,
//        let kikaku = sourceVC.kikaku else{
//            return
//        }
//        if let selectedIndexPath = self.tableView.indexPathForSelectedRow {
//            self.kikakus[selectedIndexPath.row] = kikaku
//        } else {
//        self.kikakus.append(kikaku)
//        }
//        self.userDefaults.set(self.kikakus, forKey: "kikakus")

    //self.tableView.reloadData()
    
        
        self.tableView.reloadData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
