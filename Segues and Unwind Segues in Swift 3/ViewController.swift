//
//  ViewController.swift
//  Segues and Unwind Segues in Swift 3
//
//  Created by Andrew Jaffee on 2/18/17.
//
/*
 
 Copyright (c) 2017 Andrew L. Jaffee, microIT Infrastructure, LLC, and
 iosbrain.com.
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 
*/

import UIKit

class ViewController: UIViewController
{
    
    @IBOutlet weak var tableView: UITableView!

    // create data displayed by the UITableView
    var tableViewDataSource1stSection : [String] = ["Segue 1", "Segue 2", "Segue 3"]
    var tableViewDataSource2ndSection : [String] = ["Non Segue 1"]

    // MARK: - UIViewController delegate
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        // this ViewController handles user interactions for the UITableView
        tableView.delegate = self
        // this ViewController manages data displayed by the UITableView
        tableView.dataSource = self        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Manage transitions/segues to next screen
    
    /**
     Prevent transitions/segues in table view's 2nd section (section = 1)
    */
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool
    {
        let selectedCell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: selectedCell)
        
        if indexPath?.section == 0
        {
            return true
        }
        else if indexPath?.section == 1
        {
            return false
        }
        else
        {
            return false
        }
    } // end shouldPerformSegue
    
    /**
     "In a storyboard-based application, you will often want to do a little
     preparation before navigation," like getting the destination view 
     controller, and passing data from the source view controller to
     the destination view controller.
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "tableViewCellTap"
        {
            let selectedCell = sender as! UITableViewCell
            let indexPath = tableView.indexPath(for: selectedCell)
            let destinationViewController = segue.destination as? DetailViewController
            
            destinationViewController?.sourceViewCellText = tableViewDataSource1stSection[(indexPath?.row)!]
        }
    }
    
} // end class ViewController

// MARK: - Manage user interactions with the UITableView

extension ViewController : UITableViewDelegate
{
    // what to do when the user taps on a UITableViewCell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
        print("row selected: \(indexPath.row)")
    }
}

// MARK: - Manage the data displayed in the UITableView

extension ViewController : UITableViewDataSource
{
    // provide a title for the table view to display for each section
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        if section == 0
        {
            return "Segued Content"
        }
        else if section == 1
        {
            return "Non-segued Content"
        }
        else
        {
            return ""
        }
    } // end titleForHeaderInSection
    
    // tell the table view how many sections it row are divided into
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 2;
    } // end numberOfSections
    
    // tell the table view how many rows to display in each section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if section == 0
        {
            return 3;
        }
        else if section == 1
        {
            return 1
        }
        else
        {
            return 0
        }
    } // end numberOfRowsInSection
    
    // configure each table view cell for display
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if indexPath.section == 0
        {
            cell.textLabel?.text = tableViewDataSource1stSection[indexPath.row]
        }
        else if indexPath.section == 1
        {
            cell.textLabel?.text = tableViewDataSource2ndSection[indexPath.row]
        }
        
        return cell
    } // end cellForRowAt
    
} // end extension ViewController : UITableViewDataSource
