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
    
    @IBOutlet weak var memoText: UITextView!
    
    @IBAction func saveButton(_ sender: Any) {
        saves.set(memoText.text, forKey: "myText" + memoNum)
        self.navigationController?.popViewController(animated: true)
    }
    
//    func saveButton(_ sender: Any){
//        saves.set(memoText.text, forKey: "myText" + memoNum)
//    }
    
    override func viewDidLoad() {
        memoText.text = saves.string(forKey: "myText" + memoNum)
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
