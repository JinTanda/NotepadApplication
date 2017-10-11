//
//  DetailViewController.swift
//  MyFirstApplication
//
//  Created by 丹田　尋 on 2017/10/09.
//  Copyright © 2017年 Jin Tanda. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController{
    let saves = UserDefaults.standard
    var memoNum = ""
    
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var memoText: UITextView!
    
    @IBAction func saveButton(_ sender: Any) {
        saves.set(memoText.text, forKey: "memoText" + memoNum)
        saves.set(titleText.text, forKey: "titleText" + memoNum)
        //前画面に戻る
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        memoText.text = saves.string(forKey: "memoText" + memoNum)
        titleText.text = saves.string(forKey: "titleText" + memoNum)
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
