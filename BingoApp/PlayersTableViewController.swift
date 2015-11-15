//
//  PlayersTableViewController.swift
//  BingoApp
//
//  Created by Zakk Hoyt on 11/14/15.
//  Copyright © 2015 Zakk Hoyt. All rights reserved.
//

import UIKit
import CoreLocation

class PlayersTableViewController: UITableViewController, CloudManagerDelegate {
    
    var cloudMgr = CloudManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
     
        cloudMgr.delegate = self;
        
        
////        let location = CLLocation(latitude: 37.5, longitude: -122.4)
////        cloudMgr.fetchEstablishments(location, radiusInMeters: 10000)
//        cloudMgr.fetchPlayers()
        
        cloudMgr.fetchGames()
	
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
//        return cloudMgr.players.count
        return cloudMgr.games.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Player")
//        let player = cloudMgr.players[indexPath.row]
//        cell?.textLabel?.text = player.name
        
        let game = cloudMgr.games[indexPath.row]
        cell?.textLabel?.text = game.title
        return cell!
    }

 

    func errorUpdating(error: NSError){
        print("CloudKit Error: " + error.description)
    }
    
    func modelUpdated(){
        tableView.reloadData()
    }

}
