//
//  HomeScreenViewController.swift
//  Instagram
//
//  Created by Shrijan Aryal on 9/22/18.
//  Copyright © 2018 Shrijan Aryal. All rights reserved.
//

import UIKit
import Parse
class HomeScreenViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    
    var postsArray: [Post] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let refreshControl = UIRefreshControl()
        tableView.rowHeight = 250
        
        self.loadQueries()

        tableView.dataSource = self
        tableView.delegate = self
        refreshControl.addTarget(self, action: #selector(refreshControlAction(_:)), for: UIControlEvents.valueChanged)
        // add refresh control to table view
        tableView.insertSubview(refreshControl, at: 0)

    }
    
    func loadQueries(){
        let query = PFQuery(className: "Post")
        query.order(byDescending: "createdAt")
        query.includeKey("author")
        query.includeKey("createdAt")
        query.limit = 20
        
        // fetch data asynchronously
        query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
            if let posts = posts {
             
                self.postsArray = posts as! [Post]
                //print(posts)
            } else {
                print(error?.localizedDescription)
            }
            self.tableView.reloadData()
        }
    }
    
    @objc func refreshControlAction(_ refreshControl: UIRefreshControl) {
        
        loadQueries()
        // Tell the refreshControl to stop spinning
        //self.tableView.reloadData()
        refreshControl.endRefreshing()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.postsArray.count == 0{
            return 0
        }
        else{
            return self.postsArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostViewCell", for: indexPath) as! PostViewCell
        cell.instagramPost = self.postsArray[indexPath.row]

        return cell
    }



}
