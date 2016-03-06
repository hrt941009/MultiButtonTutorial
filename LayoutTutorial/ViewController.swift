//
//  ViewController.swift
//  LayoutTutorial
//
//  Created by 臧其龙 on 16/3/2.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var modelArray = [TestModel]()
    var heightDictionary = [NSIndexPath:CGFloat]()
    @IBOutlet weak var testTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       testTableView.estimatedRowHeight = 100
        for index in 1...20 {
            let model = TestModel()
            model.buttonCount = index
            modelArray.append(model)
        }
        testTableView.reloadData()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

private let kTestTableViewCellID = "kTestTableViewCellID"
extension ViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(kTestTableViewCellID) as! TestTableViewCell
        heightDictionary[indexPath] = cell.bindWithData(modelArray[indexPath.row])
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelArray.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if let height = heightDictionary[indexPath] {
            return height
        }
        
        return 100
    }

}
