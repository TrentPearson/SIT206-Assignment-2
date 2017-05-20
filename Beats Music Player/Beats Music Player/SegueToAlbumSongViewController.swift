//
//  SegueToAlbumSongViewController.swift
//  Beats Music Player
//
//  Created by Qani Qaniu on 20/5/17.
//  Copyright © 2017 Qani Qaniu. All rights reserved.
//

import UIKit

class SegueToAlbumSongViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var viewTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(UIMenuController.update), userInfo: nil, repeats: false)
        
        // Do any additional setup after loading the view.
    }
    
    func update() {
        self.performSegue(withIdentifier: "goToAlbumSong", sender: self)
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
