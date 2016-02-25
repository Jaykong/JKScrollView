//
//  ViewController.swift
//  JKScrollView
//
//  Created by trainer on 2/25/16.
//  Copyright © 2016 trainer. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        segmentedControl.insertSegmentWithTitle(paperTypes[2], atIndex: 2, animated: true)
        segmentedControl.setTitle(paperTypes[0], forSegmentAtIndex: 0)
        segmentedControl.setTitle(paperTypes[1], forSegmentAtIndex: 1)
        
        setupTableviews(3)
        
    }
    let paperTypes = ["真题","模拟题","练习题"]
    let realPapers = ["2015真题","2014真题","2013真题","2012真题","2011真题"]
    let simulatePapers = ["2015模拟题","2014模拟题","2013模拟题","2012模拟题"]
    let praticePapers = ["2015练习题","2014练习题","2013练习题"]
    
    @IBAction func sCValueChanged(sender: AnyObject) {
    }
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    
    func setupTableviews(count:Int) -> [UITableView] {
        var jkTableviews = [UITableView]()
        for var i = 0; i < count ; ++i {
            let width = UIScreen.mainScreen().bounds.size.width
            let height = UIScreen.mainScreen().bounds.size.height
            let jkTableview = UITableView(frame: CGRect(x: CGFloat(i) * width, y: 0, width: width, height: height))
            jkTableview.tag = i
            jkTableviews.append(jkTableview)
            jkTableview.delegate = self
            jkTableview.dataSource = self
            jkTableview.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
            scrollView.addSubview(jkTableview)
            scrollView.contentSize = CGSize(width: 3 * width, height: height)
            scrollView.pagingEnabled = true
            scrollView.directionalLockEnabled = true
        }
        return jkTableviews
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView.tag {
            case 0:
                return realPapers.count
            case 1:
                return simulatePapers.count
            case 2:
                return praticePapers.count
            default:
                return 1
        }
       
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        switch tableView.tag {
            
        case 0:
            
            cell?.textLabel?.text = realPapers[indexPath.row]
            return cell!
        case 1:
            cell?.textLabel?.text = simulatePapers[indexPath.row]
            return cell!
            
        case 2:
            cell?.textLabel?.text = praticePapers[indexPath.row]
            return cell!
        default:
            return cell!
        }
    }

}

