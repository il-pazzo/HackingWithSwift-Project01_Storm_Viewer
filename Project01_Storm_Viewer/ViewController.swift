//
//  ViewController.swift
//  Project01_Storm_Viewer
//
//  Created by Glenn Cole on 10/1/17.
//  Copyright © 2017 Glenn Cole. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures        = [String]()
    var selectedImage   : String?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        title           = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles  = true

        let fm          = FileManager.default
        let path        = Bundle.main.resourcePath!
        
        let items       = try! fm.contentsOfDirectory( atPath: path )
        
        for item in items {
            
            if item.hasPrefix( "nssl" ) {
                
                pictures.append( item )
            }
        }
        
        print( pictures )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - tableview methods
    //
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return pictures.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell                = tableView.dequeueReusableCell( withIdentifier: "Picture", for: indexPath )
        
        cell.textLabel?.text    = pictures[ indexPath.row ]
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController( withIdentifier: "Detail" ) as? DetailViewController {
            
            vc.selectedImage    = pictures[ indexPath.row ]
            
            navigationController?.pushViewController( vc, animated: true )
        }
    }
}
