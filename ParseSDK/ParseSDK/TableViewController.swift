//
//  TableViewController.swift
//  ParseSDK
//
//  Created by Heather Connery on 2015-11-23.
//  Copyright © 2015 HConnery. All rights reserved.
//

import UIKit

class TableViewController: PFQueryTableViewController {
    
    override init(style: UITableViewStyle, className: String?) {
        // make a call to super class
        super.init(style: style, className: className)
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false
        self.objectsPerPage = 25
        self.parseClassName = className
    }

    // when overriding init, we have warning to add:
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }
    
    override func queryForTable() -> PFQuery {
        // do our query
        var query: PFQuery = PFQuery(className: self.parseClassName!)
        if (objects?.count == 0) {
            query.cachePolicy = PFCachePolicy.CacheThenNetwork
        }
        query.orderByAscending("name")
        return query
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell? {
        // set up our cell
        let cellIdentifier: String = "Cell"
        var cell: PFTableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? PFTableViewCell
        if cell == nil {
            cell = PFTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifier)
        }
        if let pfObject = object {
            cell?.textLabel?.text = pfObject["name"] as? String
        }
        return cell 
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
