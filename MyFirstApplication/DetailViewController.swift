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

class Memo: Object {
    dynamic var id = -1
    dynamic var title = ""
    dynamic var memo = ""

    override static func primaryKey() -> String? {
        return "id"
    }
}

class DetailViewController: UIViewController {
    var memoNum: Int?
    let realm = try! Realm() // swiftlint:disable:this force_try

    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var memoText: UITextView!

    @IBAction func saveButton(_ sender: Any) {
        let myMemo = Memo()
        myMemo.id = memoNum ?? Int(Date().timeIntervalSince1970)
        if let text = titleText.text {
            myMemo.title = text
        }
        myMemo.memo = memoText.text
        if myMemo.title != "", myMemo.memo != "" {
            try! realm.write { // swiftlint:disable:this force_try
                realm.add(myMemo, update: true)
            }
        }
        //前画面に戻る
        navigationController?.popViewController(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if let num = memoNum {
            let myMemo = realm.object(ofType: Memo.self, forPrimaryKey: num)
            titleText.text = myMemo?.title
            memoText.text = myMemo?.memo
        }
    }
}
