//
//  CrossFitTableViewController.swift
//  tableViewPractice
//
//  Created by Tai Chin Huang on 2020/12/11.
//

import UIKit
import SafariServices

class CrossFitTableViewController: UITableViewController {
    
    //將cell ID設定成常數，讓他可以自動生成
    struct PropertyKeys {
        static let crossfitCell = "crossfitCell"
    }
    //設定cell顯示array
    var events = [
        CrossFit(event: "Event 1 & 2", subtitle: "2007 Reload and Corn Sack Sprint", imageName: "Event 1 & 2", videoUrl: URL(string: "https://bit.ly/3oHaELL")),
        CrossFit(event: "Event 3", subtitle: "CrossFit Total", imageName: "Event 3", videoUrl: URL(string: "https://bit.ly/3meYUic")),
        CrossFit(event: "Event 4", subtitle: "Handstand Sprint", imageName: "Event 4", videoUrl: URL(string: "https://bit.ly/37XoXoU")),
        CrossFit(event: "Event 5", subtitle: "Ranch Loop", imageName: "Event 5", videoUrl: URL(string: "https://bit.ly/3nfgKTe")),
        CrossFit(event: "Event 6", subtitle: "Toes-to-Bar/Lunge", imageName: "Event 6", videoUrl: URL(string: "https://bit.ly/3marUHL")),
        CrossFit(event: "Event 7", subtitle: "Snatch Speed Triple", imageName: "Event 7", videoUrl: URL(string: "https://bit.ly/3ncdSGU")),
        CrossFit(event: "Event 8", subtitle: "Bike Repeater", imageName: "Event 8", videoUrl: URL(string: "https://bit.ly/3oDoLlg")),
        CrossFit(event: "Event 9", subtitle: "Happy Star", imageName: "Event 9", videoUrl: URL(string: "https://bit.ly/37YyRGz")),
        CrossFit(event: "Event 10", subtitle: "Swin'n Stuff", imageName: "Event 10", videoUrl: URL(string: "https://bit.ly/3gIftSu")),
        CrossFit(event: "Event 11", subtitle: "Sprint Sled Sprint", imageName: "Event 11", videoUrl: URL(string: "https://bit.ly/3gFyLYH")),
        CrossFit(event: "Event 12", subtitle: "Atalanta", imageName: "Event 12", videoUrl: URL(string: "https://bit.ly/3qRqhSC"))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        tableView.rowHeight = 150
        tableView.estimatedRowHeight = 0
    }

    // MARK: - Table view data source
    //有幾欄
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    //有幾列
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return events.count
    }

    //Table view data source function
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.crossfitCell, for: indexPath) as! CrossFitTableViewCell //更改cell型別成自定義CrossFitTableViewCell
        let event = events[indexPath.row]
        //設定cell顯示的photoImageView/eventLabel/subtitleLabel
        cell.photoImageView.image = UIImage(named: event.imageName)
        cell.eventLabel.text = event.event
        cell.subtitleLabel.text = event.subtitle
        // Configure the cell...
        //回傳cell
        return cell
    }
    //判斷點選cell的indexPath
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let indexPath = tableView.indexPathForSelectedRow {
            let eventVideo = events[indexPath.row]
            let url = eventVideo.videoUrl
            let safariVC = SFSafariViewController(url: url!)
            //顯示新的controller
            present(safariVC, animated: true, completion: nil)
        }
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
