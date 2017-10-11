//
//  ViewController.swift
//  MyFirstApplication
//
//  Created by 丹田　尋 on 2017/10/09.
//  Copyright © 2017年 Jin Tanda. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    
    let program = ["Swift", "Ruby", "Java"]
//    var program:[String] = []
    var memoNum = ""
//    var dictionary:Dictionary<String,Any> = [:]
//    var loads = UserDefaults.standard
//    var memoArray: Array<Any> = []
    
    override func viewDidLoad() {
//        dictionary = loads.dictionaryRepresentation()
//        memoArray = Array(dictionary.values)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
//        return memoArray.count
        return program.count
    }
    
    //セルをタップしたときに呼び出される
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        self.memoNum = String(indexPath.row)
        performSegue(withIdentifier: "toDetail", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath)
//        print(memoArray)
//        cell.textLabel!.text = memoArray[indexPath.row] as! String
        cell.textLabel!.text = program[indexPath.row]
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail"{
            let subVC : DetailViewController = segue.destination as! DetailViewController
            subVC.memoNum = self.memoNum
        }
    }
}

