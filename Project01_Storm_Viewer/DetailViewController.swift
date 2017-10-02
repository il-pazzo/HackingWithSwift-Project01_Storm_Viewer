//
//  DetailViewController.swift
//  Project01_Storm_Viewer
//
//  Created by Glenn Cole on 10/1/17.
//  Copyright © 2017 Glenn Cole. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!

    var selectedImage   : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        title           = selectedImage
        navigationItem.largeTitleDisplayMode    = .never

        if let imageToLoad = selectedImage {
            imageView.image     = UIImage( named: imageToLoad )
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear( animated )
        navigationController?.hidesBarsOnTap    = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear( animated )
        navigationController?.hidesBarsOnTap    = false
    }
    override func prefersHomeIndicatorAutoHidden() -> Bool {
        
        return navigationController!.hidesBarsOnTap
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
