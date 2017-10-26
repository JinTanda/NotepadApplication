//
//  ViewController.swift
//  MyFirstApplication
//
//  Created by 丹田　尋 on 2017/10/09.
//  Copyright © 2017年 Jin Tanda. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    let realm = try! Realm() // swiftlint:disable:this force_try
    var memoNum: Int = -1
    var memoList: Results<Memo>?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        memoList = realm.objects(Memo.self)
    }

    @IBAction func addMemoButton(_ sender: Any) {
        self.memoNum = -1
        performSegue(withIdentifier: "toDetail", sender: nil)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoList?.count ?? 0
    }

    //セルをタップしたときに呼び出される
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.memoNum = indexPath.row
        performSegue(withIdentifier: "toDetail", sender: nil)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath)
        cell.textLabel!.text = memoList?[indexPath.row].title
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let subVC = segue.destination as? DetailViewController
            subVC?.memoNum = self.memoNum
        }
    }
}
