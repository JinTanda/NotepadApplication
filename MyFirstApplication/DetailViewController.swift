//
//  DetailViewController.swift
//  MyFirstApplication
//
//  Created by 丹田　尋 on 2017/10/09.
//  Copyright © 2017年 Jin Tanda. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class Memo: Object{
    dynamic var id = -1
    dynamic var title = ""
    dynamic var memo = ""
    
    override static func primaryKey() -> String?{
        return "id"
    }
}

class DetailViewController: UIViewController{
    var memoNum = -1
    let realm = try! Realm()
    
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var memoText: UITextView!
    
    @IBAction func saveButton(_ sender: Any) {
        let myMemo = Memo()
        myMemo.id = memoNum
        myMemo.title = titleText.text!
        myMemo.memo = memoText.text!
        try! realm.write{
            realm.add(myMemo, update: true)
        }
        //前画面に戻る
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        let myMemo = realm.object(ofType: Memo.self, forPrimaryKey: memoNum)
        titleText.text = myMemo?.title
        memoText.text = myMemo?.memo
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
